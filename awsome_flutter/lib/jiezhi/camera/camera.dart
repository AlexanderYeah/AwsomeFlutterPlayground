import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool hasCameraPermission = false;
  // 代表所有的相机 前置和后置 因此是一个集合
  List<CameraDescription> _cameras = [];
  // 相机的实例化对象
  CameraController? _cameraController;
  // 后置的拍照文件
  XFile? _backImageFile;
  // 前置的拍照文件
  XFile? _frontImageFile;

  @override
  void initState() {
    super.initState();
    initCamera(1);
  }

  initCamera(int index, {double zoom = 1}) async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[index], ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _cameraController!.setZoomLevel(zoom);
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  //   1 申请相机权限 permission_handler 插件
  Future<bool> _requestCameraPermission() async {
    // 获取当前的权限
    var cameraStatus = await Permission.camera.status;

    if (cameraStatus == PermissionStatus.granted) {
      // 已经授权
      print(" 已经授权");
      return true;
    } else {
      // 未授权则发起一次授权
      cameraStatus = await Permission.camera.request();
      print("未授权");
      if (cameraStatus == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("相机")),
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () async {
                  XFile file = await _cameraController!.takePicture();
                  Uint8List bytes = await file.readAsBytes();
                },
                child: Text("拍照"))
          ],
        ));
  }
}

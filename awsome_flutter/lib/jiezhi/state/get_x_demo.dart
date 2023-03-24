import 'package:awsome_flutter/jiezhi/state/get_x_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'get_x_son.dart';

class GetXDemoPage extends StatefulWidget {
  const GetXDemoPage({super.key});

  @override
  State<GetXDemoPage> createState() => _GetXDemoPageState();
}

class _GetXDemoPageState extends State<GetXDemoPage> {
  // 通过find 方法 可以找到你已经实例化的controll
  // 这个controller 能找到的前提是继承自GetXController
  final GetXDemoController _contrl = Get.put(GetXDemoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX一级页面"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/get_x_son");
              },
              child: Text("点我登录")),
          Text("子页面输入的内容:\n"),
          Text("${_contrl.inputStatus.value}")
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_x_controller.dart';

class GetXSonDemoPage extends StatefulWidget {
  const GetXSonDemoPage({super.key});
  @override
  State<GetXSonDemoPage> createState() => _GetXSonDemoPageState();
}

class _GetXSonDemoPageState extends State<GetXSonDemoPage> {
  final GetXDemoController _contrl = Get.put(GetXDemoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX子页面"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _contrl.inputFinish("leonardo fibonacci");
              },
              child: Text("点我登录"))
        ],
      ),
    );
  }
}

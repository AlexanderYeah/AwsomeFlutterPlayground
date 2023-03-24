import 'package:awsome_flutter/jiezhi/internationalAndTheme/international_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../service/app_translation.dart';

class InternationDemoPage extends StatefulWidget {
  const InternationDemoPage({super.key});

  @override
  State<InternationDemoPage> createState() => _InternationDemoPageState();
}

class _InternationDemoPageState extends State<InternationDemoPage> {
  var _controller = Get.put(InternatonalController());

  _showDatePicker(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025));
  }

  // 第一步：应用程序入口配置
  // 第二步：创建国际化类
  // 第三步：创建控制器类，用于切换语言
  // 第四步：实例化控制器并使用

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("国际化操作"),
      ),
      body: Column(
        children: [
          // 这里如果不做国际化 日历控件显示的是英文
          ElevatedButton(
              onPressed: () {
                _showDatePicker(context);
              },
              child: Text("显示日历控件")),

          Text(
            // 这里是定义在翻译类中的关键字
            LocaleKeys.calm.tr,
          ),
          ElevatedButton(
              onPressed: () {
                _controller.changeLanguage('zh', 'CN');
              },
              child: Text("切换到中文")),
          ElevatedButton(
              onPressed: () {
                _controller.changeLanguage('en', 'US');
              },
              child: Text("切换到英文"))
        ],
      ),
    );
  }
}

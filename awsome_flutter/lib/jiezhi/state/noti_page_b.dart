import 'package:flutter/material.dart';
import 'noti_page_b_widget.dart';

class NotiPageDemoB extends StatefulWidget {
  const NotiPageDemoB({super.key});

  @override
  State<NotiPageDemoB> createState() => _NotiPageDemoBState();
}

class _NotiPageDemoBState extends State<NotiPageDemoB> {
  String _notiMsg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义通知"),
      ),
      // 监听通知
      body: NotificationListener<MyNotification>(
        // 监听通知
        onNotification: (notification) {
          _notiMsg = _notiMsg + notification.msg;
          setState(() {});
          return true;
        },

        child: Center(
          child: Column(
            children: [
              NotiPageDemoTestWidget(),
              SizedBox(
                height: 30,
              ),
              Text(_notiMsg),
            ],
          ),
        ),
      ),
    );
  }
}

// 自定义通知类 继承自Notification 类
class MyNotification extends Notification {
  final String msg;
  MyNotification(this.msg);
}

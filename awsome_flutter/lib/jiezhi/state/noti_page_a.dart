import 'package:flutter/material.dart';

class NotiPageDemoA extends StatefulWidget {
  const NotiPageDemoA({super.key});

  @override
  State<NotiPageDemoA> createState() => _NotiPageDemoAState();
}

class _NotiPageDemoAState extends State<NotiPageDemoA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotiPageDemoA"),
      ),
      body: NotificationListener(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/noti_page_b");
                },
                child: Text("自定义通知"));
          },
        ),
        onNotification: (notification) {
          // print(notification);
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("停止滚动");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
            default:
          }
          return true;
        },
      ),
    );
  }
}

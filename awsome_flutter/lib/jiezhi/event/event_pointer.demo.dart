import 'package:flutter/material.dart';

class EventPointerDemoPage extends StatefulWidget {
  const EventPointerDemoPage({super.key});

  @override
  State<EventPointerDemoPage> createState() => _EventPointerDemoPageState();
}

class _EventPointerDemoPageState extends State<EventPointerDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("事件监听"),
      ),
      body: Center(
          child: Listener(
        onPointerDown: (event) {
          // 相对于这个container 的 位置
          print(event.localPosition);
          // 相对于屏幕的位置
          print(event.position);
          // print("手指按下了$event");
        },
        onPointerMove: (event) {
          // print("手指移动了$event");
        },
        onPointerUp: (event) {
          // print("手指抬起了$event");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.redAccent,
        ),
      )),
    );
  }
}

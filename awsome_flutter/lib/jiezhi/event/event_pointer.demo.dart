import 'package:awsome_flutter/jiezhi/event/my_event_bus.dart';
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
        body: Column(
          children: [
            _eventBusDemo(),
            // Listener(
            //   onPointerDown: (event) {
            //     // 相对于这个container 的 位置
            //     print(event.localPosition);
            //     // 相对于屏幕的位置
            //     print(event.position);
            //     // print("手指按下了$event");
            //   },
            //   onPointerMove: (event) {
            //     // print("手指移动了$event");
            //   },
            //   onPointerUp: (event) {
            //     // print("手指抬起了$event");
            //   },
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.redAccent,
            //   ),
            // ),
            SizedBox(
              height: 100,
            ),
            // gesture
            // _gestureDemo(),
            // _gestureDemo2()
          ],
        ));
  }

  _gestureDemo() {
    return GestureDetector(
      onTap: () {
        print("点击事件完成了");
      },
      onPanEnd: (details) {
        print(details);
      },
      onTapDown: (details) {
        // 相对于container
        print(details.localPosition);
        // 相对于屏幕的
        print(details.globalPosition);
      },
      onTapUp: (details) {
        // 抬起之后 才会调用 onTap ，证明点击事件完成了
        print("1111");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blueAccent,
      ),
    );
  }

  _gestureDemo2() {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print("blue click");
          },
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blueAccent,
          ),
        ),
        GestureDetector(
          onTap: () {
            print("yellow click");
          },
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 150,
            color: Colors.yellow,
          ),
        )
      ],
    );
  }

  _eventBusDemo() {
    return Column(
      children: [EPChildButton(), EPChildText()],
    );
  }
}

class EPChildButton extends StatelessWidget {
  const EPChildButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("点击事件");
          // 第二步fire
          eventBus.fire(MyEventMessage("leonardo", "hahaha"));
        },
        child: Text("改变文字"));
  }
}

class EPChildText extends StatefulWidget {
  const EPChildText({super.key});

  @override
  State<EPChildText> createState() => _EPChildTextState();
}

class _EPChildTextState extends State<EPChildText> {
  String _name = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 第三步监听操作
    eventBus.on<MyEventMessage>().listen((event) {
      print(event.name);
      setState(() {
        _name = event.name!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_name),
    );
  }
}

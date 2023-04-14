import 'package:flutter/material.dart';

class RowStudyPageDemo extends StatefulWidget {
  const RowStudyPageDemo({super.key});

  @override
  State<RowStudyPageDemo> createState() => _RowStudyPageDemoState();
}

class _RowStudyPageDemoState extends State<RowStudyPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("你好"),
        ),
        body: Column(
          children: [_demo1(), _demo2(), _demo3(), _demo4()],
        ));
  }

  _demo1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.cyan,
          width: 70,
          height: 150,
        ),
        Container(
          color: Colors.orange,
          width: 120,
          height: 100,
        ),
        Container(
          color: Colors.blueAccent,
          width: 90,
          height: 80,
        )
      ],
    );
  }

  _demo2() {
    // Row的特点
    // - 水平方向尽可能的占据比较大的空间,如果需要设置水平防线也需要包裹内容 MainAxisSize.min
    // - 垂直方向包裹内容
    /**
     * MainAxisAlignment 这个枚举类型 
     * 
     * 
     * */

    return ElevatedButton(
        onPressed: () => print("onPressed"),
        child: Row(
          //
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("data"), Icon(Icons.video_call)],
        ));
  }

  _demo3() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 80,
            color: Colors.cyan,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 80,
            color: Colors.orangeAccent,
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              height: 80,
              color: Colors.redAccent,
            ))
      ],
    );
  }

  // Stack 层叠组件
  _demo4() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.network("https://picsum.photos/200/300?random=1"),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.cyan,
              child: Text(
                "这是一张图片",
                style: TextStyle(color: Colors.redAccent, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    );
  }
}

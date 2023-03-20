import 'package:flutter/material.dart';

class ButtonDemoPage extends StatefulWidget {
  const ButtonDemoPage({super.key});

  @override
  State<ButtonDemoPage> createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          // 普通的文本按钮
          TextButton(
            onPressed: null,
            child: Text(
              "TextButton",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                // 固定宽度
                fixedSize: MaterialStateProperty.all(Size(200, 30)),
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
          ),
          //
          ElevatedButton(onPressed: null, child: Text("ElevatedButton")),

          // outlined
          OutlinedButton(
            onPressed: null,
            child: Text("OutlinedButton"),
            style: ButtonStyle(
                // 通过shape 可以设置其圆角
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
          ),
          // IconButton
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.close,
                color: Colors.redAccent,
              )),

          FloatingActionButton(
            onPressed: null,
            child: Text("+"),
          ),
        ],
      ),
    );
  }
}

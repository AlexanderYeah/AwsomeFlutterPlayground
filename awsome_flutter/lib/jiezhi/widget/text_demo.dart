import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextDemoPage extends StatefulWidget {
  const TextDemoPage({super.key});

  @override
  State<TextDemoPage> createState() => _TextDemoPageState();
}

class _TextDemoPageState extends State<TextDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // 普通文本
          Text(
            "So to be so direct,but how much do you pay for this?",
            textAlign: TextAlign.center,
            style: TextStyle(
                // 词间距
                wordSpacing: 2,
                color: Colors.deepOrange),
          ),
          SizedBox(
            height: 20,
          ),
          // 富文本 RichText 和 TextSpan 的结合使用实现富文本
          RichText(
            text: TextSpan(
                text: "This medicine",
                // 最外层的style
                style: TextStyle(fontSize: 30, color: Colors.redAccent),
                // 里层的内容 如果不设置style 就会继承上面的样式
                children: [
                  // 第二个内容
                  TextSpan(
                      text: " properly used ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700)),

                  TextSpan(
                      text: "will do you a lot of good!",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w700))
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          // 我已阅读使用条款和隐私政策
          RichText(
              text: TextSpan(
                  text: "我已阅读 ",
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("链接到使用条款的的地方");
                      },
                    text: "使用条款",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline)),
                TextSpan(text: " 和 "),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("链接到隐私政策的地方");
                      },
                    text: "隐私政策",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline))
              ]))
        ],
      ),
    );
  }
}

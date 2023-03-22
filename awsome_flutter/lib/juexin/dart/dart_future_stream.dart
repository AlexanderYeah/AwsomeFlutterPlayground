import 'package:flutter/material.dart';

class DartFutureAndStreamPage extends StatefulWidget {
  const DartFutureAndStreamPage({super.key});

  @override
  State<DartFutureAndStreamPage> createState() =>
      _DartFutureAndStreamPageState();
}

class _DartFutureAndStreamPageState extends State<DartFutureAndStreamPage> {
  _useFuture() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Future And Stream"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "一 Future",
                style: TextStyle(fontSize: 22, color: Colors.blueAccent),
              ),
              Text(
                  "Future是Dart中提供的一个抽象类、泛型类，它用于封装一段在将来会被执行的代码逻辑。构造一个Future就会向event queue中添加一条记录"),
              Text("Future有三种状态未完成、完成带有值、完成带有异常"),
              Text(
                  "await只能在async函数出现。 async函数，返回值是一个Future对象，如果没有返回Future对象，会自动将返回值包装成Future对象。 捕捉错误，一般是使用try/catch机制来做异常处理。 await 一个future，可以拿到Future的结果，直到拿到结果，才执行下一步的代码。")
            ],
          ),
        ));
  }
}

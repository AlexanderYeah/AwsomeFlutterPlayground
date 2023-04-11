import 'package:flutter/material.dart';

class MyInheritedCounter extends InheritedWidget {
  // 这是共享的数据
  final int counter;

  const MyInheritedCounter(
      {super.key, required this.child, required this.counter})
      : super(child: child);

  final Widget child;

  static MyInheritedCounter? of(BuildContext context) {
    // 沿着Element 树 去找最近的MyInheritedCounter，从Element 中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType<MyInheritedCounter>();
  }

  // 这个方法决定了要不要回调State中的didChangeDependencies
  // 如果返回true,那么就会执行当前InheritedWidget 的state 中的  didChangeDependencies 方法
  @override
  bool updateShouldNotify(MyInheritedCounter oldWidget) {
    return true;
  }
}

class InheritedDmeoPage extends StatefulWidget {
  const InheritedDmeoPage({super.key});
  @override
  State<InheritedDmeoPage> createState() => _InheritedDmeoPageState();
}

class _InheritedDmeoPageState extends State<InheritedDmeoPage> {
  int _count = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: MyInheritedCounter(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [InheritedDmeoData1(), InheritedDmeoData2()],
            ),
          ),
          counter: _count),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class InheritedDmeoData1 extends StatefulWidget {
  const InheritedDmeoData1({super.key});

  @override
  State<InheritedDmeoData1> createState() => _InheritedDmeoData1State();
}

class _InheritedDmeoData1State extends State<InheritedDmeoData1> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies 被调用了");
  }

  @override
  Widget build(BuildContext context) {
    // 获取数据
    int counter = MyInheritedCounter.of(context)!.counter;
    return Container(
      color: Colors.blueAccent,
      child: Text(
        "${counter}",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}

class InheritedDmeoData2 extends StatefulWidget {
  const InheritedDmeoData2({super.key});

  @override
  State<InheritedDmeoData2> createState() => _InheritedDmeoData2State();
}

class _InheritedDmeoData2State extends State<InheritedDmeoData2> {
  @override
  Widget build(BuildContext context) {
    int counter = MyInheritedCounter.of(context)!.counter;

    return Container(
      color: Colors.deepOrange,
      child: Text(
        "${counter}",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SingleThreadPage extends StatefulWidget {
  const SingleThreadPage({super.key});

  @override
  State<SingleThreadPage> createState() => _SingleThreadPageState();
}

class _SingleThreadPageState extends State<SingleThreadPage> {
  // 自定义添加一个事件
  _sizeWidget() {
    /**
     打印结果
flutter: start
flutter: end
flutter: this is value
     不阻塞主线程 
    */
    print("start");
    Future.value("this is value").then((value) => print(value));
    print("end");
    return SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单线程模型")),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "一 单线程模型",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
                "Dart是一种单线程语言，因此Dart程序没有主线程和子线程之分，而在Dart中线程并不是指Thread，而是指Isolate。因为Dart没有线程的概念，只有Isolate，每个Isolate都是隔离的，并不会共享内存。所有的Dart代码都是在Isolate中运行，它就像机器上的一个小空间，具有自己的私有内存块和一个运行着事件循环模型的单线程。也就是说，一旦某个Dart函数开始执行，它将执行到这个函数的结束而不被其他Dart代码打断，这就是单线程的特性。"),
            Text(
                "默认情况下，Dart程序只有一个Isolate(未自己创建的情况下)，而这个Isolate就是Main Isolate。也就是说，一个Dart程序是从Main Isolate的main函数开始的，而在main函数结束后，Main isolate线程开始一个一个处理事件循环模型队列中的每一事件(Event)。上图描述的就是Main Isolate的消息循环模型"),
            SizedBox(
              height: 20,
            ),
            Text(
              "二 事件循环",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
              "Dart 在单线程中是以消息循环机制来运行的，其中包含两个任务队列，一个是“微任务队列” microtask queue，另一个叫做“事件队列” event queue。",
              style: TextStyle(fontSize: 20),
            ),
            Text("以下是图片详解"),
            Image.asset("images/jx_single_thread.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "三 具体概念",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
              "1> 消息循环(Event Looper)",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
                "消息循环就是指一个永不停歇且不能阻塞的循环，它将不停的尝试从微任务队列和事件队列中获取事件(event)进行处理，而这些Event包括了用户输入，点击，Timer，文件IO等。"),
            Text(
              "2> 事件队列(Event queue)",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
                "该队列的事件来源于外部事件和Future，其中，外部事件主要包括I/O，手势，绘制，计时器和isolate相互通信的message等，而Future主要是指用户自定义的异步任务，通过创建Future类实例来向事件队列添加事件。需要注意的是，当Event looper正在处理Microtask Queue时，Event queue会被阻塞，此时APP将无法进行UI绘制，响应用户输入和I/O等事件"),
            _sizeWidget(),
            Text(
              "3> 微任务队列(Microtask queue)",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
                "该队列的事件来源与当前isolate的内部或通过scheduleMicrotask函数创建，Microtask一般用于非常短的内部异步动作，并且任务量非常少，如果微任务非常多，就会造成Event queue排不上队，会阻塞Event queue的执行造成应用ANR，因为Microtask queue的优先级高于Event queue。因此，大多数情况下的任务优先考虑使因此，大多数情况下的任务优先考虑使用Event queue，不到万不得已不要使用Microtask queue。")
          ],
        ),
      ),
    );
  }
}

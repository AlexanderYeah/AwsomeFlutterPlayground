import 'dart:io';
import 'dart:isolate';

main(List<String> args) async {
  print("main start");
  // 1
  ReceivePort receivePort = ReceivePort();
  // 2  spawn 返回的是future 所以要异步操作
  Isolate isolate =
      await Isolate.spawn<SendPort>(calculate, receivePort.sendPort);

  // 可以给创建的isolate 中发送消息
  receivePort.sendPort.send("这是从main isolate 发送的消息");

  //3 监听创建的isolate的回调信息
  receivePort.listen((message) {
    print(message);
    // 收到结果 关闭 kill
    receivePort.close();
    isolate.kill();
  });

  print("main end");
}

calculate(SendPort port) {
  // 模拟耗时操作
  sleep(Duration(seconds: 2));
  // 回调信息
  port.send("这是从创建的isolate 发送的信息");
}

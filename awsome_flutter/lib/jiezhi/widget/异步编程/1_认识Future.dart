import 'dart:io';

main(List<String> args) {
  // 阻塞主线程的调用
  // blockMainThread();
  // 异步调用
  asyncMethod();
}

/*****----- 异步的调用方式 ---***/
void asyncMethod() {
  /**
   * main start
    main end
    hello world
   * */
  print("main start");
  var future = getAsyncNetworkData();
  future.then((String value) {
    // 只有拿到结果 才会执行这里面的代码
    print(value);
  }).catchError((error) {
    // 打印结果 Exception: 我是错误信息
    print(error);
  }).whenComplete(() {
    // 代码走这，不管成功或者失败都会走这里
    print("代码执行完毕");
  });
  print("main end");
}

Future<String> getAsyncNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    // return "hello world";

    // 抛出异常
    throw Exception("我是错误信息");
  });
}

/*****----- 阻塞主线程的调用方式 ---***/
void blockMainThread() {
  /**
   * main start
    this is hello world
    main end
   * 
  */
  print("main start");
  var res = getNetworkData();
  print(res);
  print("main end");
}

// 模拟网络请求
String getNetworkData() {
  // 阻塞2秒
  sleep(Duration(seconds: 2));
  return "this is hello world";
}

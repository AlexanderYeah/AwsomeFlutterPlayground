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
    print(value);
  });
  print("main end");
}

Future<String> getAsyncNetworkData() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    return "hello world";
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

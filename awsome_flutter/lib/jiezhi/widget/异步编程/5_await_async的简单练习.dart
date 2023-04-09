import 'dart:io';

main(List<String> args) {
  print("main start");
  // getData();
  futureMethodData();
  print("main end");
}

// future 的实现方式
futureMethodData() {
  Future(() {
    // 这是第一次网络请求
    sleep(Duration(seconds: 2));
    return "这是第一次网络请求结果";
  }).then((value) {
    print(value);
    sleep(Duration(seconds: 2));
    return value + "这是第二次网络请求结果";
  }).then((value) {
    print(value);
    sleep(Duration(seconds: 2));
    return value + "这是第三次网络请求结果";
  }).then((value) {
    print(value);
  });
}

// async-await 的实现方式
getData() async {
  // 模拟三次网络请求
  /**
   * 
   * main start
    main end
    args1helloworld
    args1helloworldhelloworld
    args1helloworldhelloworldhelloworld
   */
  var res1 = await getNetworkData("args1");
  print(res1);
  var res2 = await getNetworkData(res1);
  print(res2);
  var res3 = await getNetworkData(res2);
  print(res3);
}

getNetworkData(String args) {
  return Future(() {
    sleep(Duration(seconds: 2));
    return args + "helloworld";
  });
}

import 'dart:io';

main(List<String> args) {
  print("main start");
  /**
   * main start
    main end
    第一次网络请求的结果
    第二次网路请求的结果
    第三次网路请求的结果
   * 
   * */
  // 这种方式可以解决回调地狱的问题 多个网络请求依赖也不用进行嵌套调用 直接链式调用即可
  Future(() {
    // 这是第一次网络请求
    sleep(Duration(seconds: 2));
    return "第一次网络请求的结果";
  })
      .then((res) {
        print(res);
        sleep(Duration(seconds: 2));
        // 这是第二次网络请求
        return "第二次网路请求的结果";
      })
      .then((res) {
        print(res);
        sleep(Duration(seconds: 2));
        return "第三次网路请求的结果";
      })
      .then((value) => print(value))
      .catchError((error) {
        print(error);
      });
  print("main end");
}

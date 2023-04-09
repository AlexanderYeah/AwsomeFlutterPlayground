main(List<String> args) {
  print("main start");
  // 1 延时调用
  Future.delayed(Duration(seconds: 2), () {
    return "hello world";
  }).then((value) => print(value));
  print("main end");
}

import 'dart:io';

main(List<String> args) {
  print("main start");
  var res = getNetworkData();
  print("main end");
}

// 模拟耗时操作
Future getNetworkData() async {
  var res = await Future.delayed(Duration(seconds: 2), () {
    return "hello world";
  });
  print(res);
}

main(List<String> args) {
  print(Person.nickName);
  Person.eat();
}

class Person {
  // 成员属性 实例化调用
  String name = "123";
  // 类属性 可以通过类直接调用
  static String nickName = "456";
  //  成员方法
  void run() {}
  // 类方法
  static eat() {
    print("eating something");
  }
}

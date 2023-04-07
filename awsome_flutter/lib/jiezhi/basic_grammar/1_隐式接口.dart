main(List<String> args) {
  SuperMan s = SuperMan();
  s.flying();
}

class Animal {
  void eating() {}
}

// Dart 中没有哪一个关键字是定义接口的，没有这些关键字interface/protocal
// 默认情况下 所有的类都是隐式接口
// Dart 只支持单继承
// 当一个类当做接口使用的时候，那么实现这个接口的类 必须实现这个接口中所有的方法 ，并且在其实现方法中不能调用super 因为不是继承
// 而继承的话 不是必须要实现父类的方法的
class Runner {
  void running() {}
}

class Flayer {
  void flying() {}
}

// 超人想要实现奔跑和飞行  不能同时继承两个 可以用implements
class SuperMan extends Animal implements Runner, Flayer {
  @override
  void flying() {
    // TODO: implement flying
    print("flying");
  }

  @override
  void running() {
    print("running");
    // TODO: implement running
  }
}

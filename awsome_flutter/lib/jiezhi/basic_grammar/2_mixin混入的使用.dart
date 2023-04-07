main(List<String> args) {
  final s = SuperMan();
  s.flying();
  s.running();
  s.haveSomeRest();
  print(s.mood);

  // on 关键字的演示
  final t = Test();
  t.test1();
  t.test2();
  t.test3();
}
//  mixin 就是混入的意思，就是在类中混入其他功能 ，说白了就是在现有的类的基础上 引入一些新的变量
// 1 作为mixin的类只能继承自object 不能继承其他的类
// 2 作为mixin的类 不能有构造函数
// 3 一个类可以mixins多个mixin类
// 4 mixins 不是继承 也不是接口 而是一种全新的特性

class Animal {
  void eating() {}
  void running() {
    print("Animal - Running");
  }

  void flying() {
    print("Flayer - Flying");
  }
}
// mixin 本身可以是抽象的 可以定义各类的方法和属性 等待后续的类去实现

mixin Runner {
  // 定义变量
  var mood = "Runner-happy";

  void running() {
    print("Runner - Running");
  }

  void haveSomeRest();
}

mixin Flayer {
  // 定义变量
  var mood = "Flayer-sad-sad";
  void flying() {
    print("Flayer - Flying");
  }
}

//问题1 现在的状况是 继承的类 有running ,h混入的类也有running ,那么这个类会执行哪一个个方法？
// 执行的结果是 执行混入的类  Flayer - Flying Runner - Running

// 问题2：混入的类定义方法定义的方法未实现，那么使用的类必须是要实现这个方法

// 问题3：上面的两个混入的类都定义的有mood 属性，则后混入的会覆盖之前的，以这样的方式解决冲突

class SuperMan extends Animal with Runner, Flayer {
  @override
  void haveSomeRest() {
    // TODO: implement haveSomeRest
    print("haveSomeRest");
  }
}
/*****--- on 关键字 基于某个类型的mixin -----***/
// 当使用on 关键字的时候，则表示mixin只能在那个类中的子类中使用，这就代表了mixin 中可以调用那个类的方法和属性

class BaseMixin {
  void method() {
    print("BaseMixin-method");
  }
}

mixin TestMixin1 on BaseMixin {
  int testValue = 2;
  void test1() {
    print('test1');
  }

  void test2() {
    method();
  }

  void test3();
}

class Test extends BaseMixin with TestMixin1 {
  @override
  void test3() {
    // TODO: implement test3
    print("Test - test3");
  }
}

import 'package:flutter/material.dart';

class BasicGrammarPage extends StatefulWidget {
  const BasicGrammarPage({super.key});

  @override
  State<BasicGrammarPage> createState() => _BasicGrammarPageState();
}

class _BasicGrammarPageState extends State<BasicGrammarPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础语法"),
      ),
      body: _buildItem(),
    );
  }

  _buildItem() {
    var p = BasicPerson("111");
    print(p.age);

    const car1 = BasicCar("Audi");
    const car2 = BasicCar("Audi");
    // identical  identical 判断是否相等
    // const关键字在多个地方创建相同的对象的时候，内存中只保留了一个对象
    // 打印结果是相等的
    print(identical(car1, car2));

    var a1 = BasicAnimal.withName("Leo");
    var a2 = BasicAnimal.withName("Leo");
    // 是相等的
    print(identical(a1, a2));

    var h = BasicHouse();
    // setter 方法
    h.setName = "dgf";
    print(h.getName);
    return Text("编译");
  }
}

const temp = 30;

class BasicPerson {
  final String name;
  final int? age;
  // 构造方法后面的冒号就是初始化列表 可以使用assert 校验属性的值 如果不符合输入就会报错
  // BasicPerson(this.name, {this.age = 99});
  // BasicPerson(this.name, {this.age = 0}) : assert(age! < 150) {
  //   print("object");
  // }

  // 构造函数的重定向
  BasicPerson(String name) : this._internal(name, 88);
  BasicPerson._internal(this.name, this.age);
}

// 常量构造函数 就是用const 进行修饰的构造函数
// 成员变量必须都是final 类
// 在特定情况下使用常量构造函数，能极大节约内存空间，并有效提升应用性能
class BasicCar {
  final String? name;
  const BasicCar(this.name);
}

// dart 提供了factory 关键字 用于通过工厂去获取对象
// 最大的特点就是可以手动的返回对象
class BasicAnimal {
  String? name;
  String? color;
  BasicAnimal(this.name, this.color);
  // 缓存列表
  static final Map<String, BasicAnimal> _nameCache = {};
  static final Map<String, BasicAnimal> _colorCahce = {};

  factory BasicAnimal.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name] as BasicAnimal;
    } else {
      // 没有的话 创建一个
      final a = BasicAnimal(name, "default");
      _nameCache[name] = a;
      return a;
    }
  }

  factory BasicAnimal.withColor(String color) {
    if (_colorCahce.containsKey(color)) {
      return _colorCahce[color] as BasicAnimal;
    } else {
      // 没有的话 创建一个
      final a = BasicAnimal("default", color);
      _colorCahce[color] = a;
      return a;
    }
  }
}

// setter 和 getter

class BasicHouse {
  String? name;
  // setter
  set setName(name) {
    this.name = name;
    print("setter 被调用了");
  }

  String get getName {
    return this.name ?? "";
  }
}

// 抽象类
// 可以放一些函数 不实现
abstract class Shape {
  int getArea();
  // factory Shape() {
  //   return Rectangle();
  // }
}

// 注意1：抽象类的方法 必须在子类中进行实现
// 注意2：抽象类 不能实例化
// Dart中 List 和 Map 都是抽象类 也能实例化 他是因为使用 external factory Map(); 工厂方法实例化的
// 这个external 这个关键字的作用 是把方法的声明 和 方法的实现 分离 后面用@patch  进行实现
// @patch  factory Map() => new LinkedHashMap<k,v>()
class Rectangle extends Shape {
  @override
  int getArea() {
    // TODO: implement getArea
    return 200;
  }
}

import 'package:flutter/material.dart';

List jx_list_data = [
  {
    "route": "/dart_list",
    "title": "Dart部分",
    "content": "在 Dart 中，一切都是对象，所有的对象都是继承自 Object"
  },
  {"route": "/widget_list", "title": "Widget部分", "content": "widget"},
  {"route": "/research_key_list", "title": "Key的原理研究", "content": "Key的原理研究"},
];

List jx_dart_list_data = [
  {
    "title": "Dart的语言特性",
    "content": "1>Productive 生产力高 \n2> 执行速度快 \n3>易于移植 \n4> 容易上手 \n 5> 响应式编程"
  },
  {
    "title": "Dart 的重要概念",
    "content":
        "1>在 Dart 中，一切都是对象，所有的对象都是继承自 Object,\n 2>Dart 是强类型语言，但可以用 var 或 dynamic 来声明一个变量，Dart 会自动推断其数据类型 \n 2>没有赋初值的变量都会有默认值 null \n 3> Dart 没有 public protected private 等关键字，如果某个变量以下划线（_）开头，代表这个变量在库中是私有的"
  },
  {
    "title": " Dart 是不是单线程模型？是如何运行的？（点击查看）",
    "content": "Dart 是单线程模型,而微任务队列的优先级要高于事件队列"
  },
  {
    "title": "dart是值传递还是引用传递？",
    "content":
        "1>在dart中对于基础数据类型String、int、bool、double是值传递也就是说给传入函数内的形参赋值不会改变外部变量的入参的值2>而对象List、Set、Map、class是引用传递我们每次调用函数，传递过去的对象都是对象的内存地址，而不是这个对象的复制。参数是把内存地址传过去了，如果对这个内存地址上的对象修改，那么其他位置的引用该内存地址的变量值也会修改。"
  },
  {
    "title": "Future (点击查看)",
    "content":
        "字面意思「未来」，是用来处理异步的工具。Dart 在单线程中是以消息循环机制来运行的，其中包含两个任务队列，一个是“微任务队列” microtask queue，另一个叫做“事件队列” event queue。Future 默认情况下其实就是往「事件队列」里插入一个事件，当有空余时间的时候就去执行，当执行完毕后会回调 Future.then(v) 方法。"
  },
  {
    "title": "extends，implements,with 的用法和区别",
    "content":
        "这三种关系可以同时存在，前后有顺序extends->with->implements的顺序,\n 1>继承子类可以访问父类中所有的变量和方法 \n 2> 混入的对象是类，可以混入多个，mixin 定义的类不能有构造方法，这样可以避免多继承而产生的父类构造方法的冲突 \n 3> 一个类可以通过关键字implements 来实现一个或者多个接口并实现每个接口定义的API,例如想要创建一个A类支持B类的API 且不想继承B类，那就可以实现B类的接口"
  },
  {
    "title": "Flutter 中的key、LocalKey、GlobalKey",
    "content":
        "key派生出两种不同用途的Key:LocalKey、GlobalKey,LocalKey 直接继承自Key,它应用于拥有想通父Element的小部件进行比较的情况，GlobalKey 使用了一个静态常量 Map 来保存它对应的 Element。你可以通过 GlobalKey 找到持有该GlobalKey的 Widget，State 和 Element"
  },
];

List jx_widget_list_data = [
  {
    "route": "/widget_state_life_cycle",
    "title": "State 的生命周期",
    "content": "生命周期",
    "tips": ""
  },
  {
    "route": "/widget_state_manage",
    "title":
        "什么是状态管理? 总结来说就是：状态管理就是当某个状态发生改变的时候，告知使用该状态的状态监听者，让状态所监听的属性随知改变,从而达到联动效果。",
    "content": "ScopedModel,BLoC,Redux / FishRedux,Provider",
    "tips": ""
  },
  {
    "route": "",
    "title": "Flutter 快速实现国际化",
    "content": "1、通过Flutter Intl插件实现：在Plugins里面找到Flutter Intl这个插件，然后安装-重启",
    "tips":
        "1、通过Flutter Intl插件实现：在Plugins里面找到Flutter Intl这个插件，然后安装-重启 /n 2> GetX来实现"
  },
  {
    "route": "/communicate_html",
    "title": "Flutter 调用H5",
    "content": "Flutter 和 H5 之间的相互调用"
  },
  {
    "route": "/communicate_device",
    "title": "Flutter 调用原生操作",
    "content": "Flutter 和原生之间的通信"
  },
];

List jx_reseach_key_list_data = [
  {"route": "/rk_normal_key", "title": "普通的key", "content": "", "tips": ""},
  {
    "route": "/rk_widget_element",
    "title": "Widget 和 Element",
    "content": "Widget 和 Element 的对应关系",
    "tips":
        "但真正绘制在屏幕上的并不是这个Widget Tree, 我们都知道Wdiget是描述UI元素Element的配置,所以实际运行起来的时候,还会产生一个Element Tree, Element Tree就是Widget Tree实例化之后产生的对象,Widget Tree —实例化—> Element Tree"
  },
  {
    "route": "/rk_global_key",
    "title": "GlobalKey的用法",
    "content": "获取state,widget,context",
    "tips": "获取对应的state,widget,context"
  },
];

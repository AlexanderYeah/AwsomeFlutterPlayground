import 'package:flutter/material.dart';

List jx_list_data = [
  {"title": "Dart部分", "content": "在 Dart 中，一切都是对象，所有的对象都是继承自 Object"},
  {"title": "Widget部分", "content": "widget"},
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
];
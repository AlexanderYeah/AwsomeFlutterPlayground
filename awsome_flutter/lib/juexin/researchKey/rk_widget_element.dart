import 'package:flutter/material.dart';
import '../../util/edit.dart';

class RKWidgetAndElement extends StatefulWidget {
  const RKWidgetAndElement({super.key});

  @override
  State<RKWidgetAndElement> createState() => _RKWidgetAndElementState();
}

class _RKWidgetAndElementState extends State<RKWidgetAndElement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget 和Element 对应的关系"),
      ),
      body: ListView(
        children: [
          Edit.instance().header("一 Widget Tree"),
          Edit.instance().text(
              "真正绘制在屏幕上的并不是这个Widget Tree, 我们都知道Wdiget是描述UI元素Element的配置,所以实际运行起来的时候,还会产生一个Element Tree, Element Tree就是Widget Tree实例化之后产生的对象."),
          Edit.instance().text(
              "Widget负责如何渲染,比如颜色,大小,形状等等,Element负责管理里面的状态,为啥要分开的呢?因为Widget是不可变的,鼠标放到Widget上面就有这样的提示 A widget is an immutable description of part of a user interface. Widgets can be inflated into elements, which manage the underlying render tree."),
          Edit.instance().text(
              "widget不可变,意思就是创建之后就不能在运行时改变它,但是State是可以变的.通常我们会用setState通知flutter去重建一个新的widget,而不是去改变这个widget,因为widget是不可变的.但是丢掉这个widget,并没有把状态也一起丢掉,因为大部分UI的设计,是通过我们改变Widget来实现的,所以如果能把Widget和State分开,在hot reload的时候,就能在改动widget的时候保留它的状态. 如果widget每次有变化,state就丢掉的话,程序就没法用了,没有办法支持Hot Reload和动画效果了."),
          Edit.instance().header("二 为什么上个案例改变Widget的顺序,UI没有发生改变？"),
          Edit.instance().text(
              "所以当Wdiget改变的时候,我们尽量将它与原来的State关联起来.当Widget改变的时候,flutter会去看Wdiget和这个Element是不是同样的的,比如我们把Columen换成Row,那它们就不一样了,然后会去看Key是一样,这也就是Key可以帮助Flutter把容易混淆的Widget区分清楚.当然,如果不传key,它就没办法对比key了,如果widget不变,依然会使用之前的element."),
          Edit.instance().text(
              " Element 是 Widget 的一个实例化对象，它承载了视图构建的上下文数据，是连接结构化的配置信息到完成最终渲染的桥梁"),
          Edit.instance().header("三 Key的种类 "),
          Edit.instance().text(
              "LocalKey 局部键,在同一级中要唯一,可以理解为同级唯一性 \n GlobalKey 全局键 , 在整个App中必须是唯一的."),
          Edit.instance().header("四 LocalKey又有3个子类 "),
          Edit.instance().text(
              "1 ValueKey : 它的构造方法很简单,有一个value,类型是T,也就是随便你想传什么都可以.当然因为唯一性原则,   \n 2 ObjectKey  ObjectKey跟ValueKey大同小异,我们主要看一下区别,value的类型从T变成了Object  \n 3 UniqueKey UniqueKey是一个独一无二的Key,也就是说它只和自己相等.因此UniqueKey()和UniqueKey()是不相等的. 进行hot reload,发现状态丢失了,因为Key变了, 新的UniqueKey和旧的是不相等的.所以state就没有办法保留下来. \n 其实当你的Widget全都是StatelessWidget的时候,不需要用到Key,只有当使用Statefuldiget的时候才有可能用到key"),
          Edit.instance().text("如何防止状态丢失呢? 把UniqueKey 定义到外部")
        ],
      ),
    );
  }
}

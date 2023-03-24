import 'package:flutter/material.dart';

class StateManagePage extends StatefulWidget {
  const StateManagePage({super.key});

  @override
  State<StateManagePage> createState() => _StateManagePageState();
}

class _StateManagePageState extends State<StateManagePage> {
  _headerLine(title) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("\n ${title}",
            style: TextStyle(fontSize: 20, color: Colors.blueAccent))
      ],
    );
  }

  _textLine(content) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("\n ${content}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("状态的管理"),
        ),
        // 参考：https://z.itpub.net/article/detail/B945A0706C20526BB7EF7C78EE0A8780

        body: Container(
          margin: EdgeInsets.all(15),
          child: ListView(
            children: [
              _headerLine("一 什么是状态管理"),
              _textLine(
                  "状态管理就是当某个状态发生改变的时候，告知使用该状态的状态监听者，让状态所监听的属性随知改变,从而达到联动效果。"),
              _headerLine("二 不同的状态管理分类"),
              _textLine(
                  "1 短时状态:某些状态、或是可以理解为某些数据只需要在当前的Widget中访问和使用，不需要对这些状态进行共享访问，你需要的只是一个StatefulWidget组件，依靠这个StatefulWidget组件自己的State类自己管理即可，不需要使用状态管理框架去管理这种状态，这些状态可以称之为短时状态。如：官网中的计数器Demo、比如一个PageView组件记录当前的页面"),
              _textLine(
                  "2 应用状态:某些状态需要被组件共享访问，当这个状态发生变化的时候，其他组件也需要随之发生联动的变化，这就是应用状态。举个例子来说明，比如一个电商App，在商品的详情页面，我们把某个商品加入了购物车，那么商品是否放入购物车这个状态，就需要被购物车页面组件所访问，那么这个状态就是应用状态。试想一下，如果再不使用第三方状态管理框架的情况下，我们可以怎么实现呢，可以使用InheritedWidget定向的传递，可以通过Notification进行通知，可以使用event_bus来进行事件订阅等等，其实我们所说的状态管理框架，也是基于上面说的等几种方式来实现的。"),
              _headerLine("三 Flutter中有哪些可以做到状态管理"),
              _textLine("1 State 缺点是 无法做到跨组件共享数据,"),
              _textLine(
                  "2 InheritedWidget 它的天生特性就是能绑定InheritedWidget与依赖它的子孙组件的依赖关系，并且当InheritedWidget数据发生变化时，可以自动更新依赖的子孙组件！利用这个特性，我们可以将需要跨组件共享的状态保存在InheritedWidget中，然后在子组件中引用InheritedWidget即可。专门负责Widget树中数据共享的功能型Widget，如Provider、scoped_model就是基于它开发的。"),
              _textLine(
                  "InheritedWidget缺点：每次更新都会通知所有的子Widget，无法定向通知/指向性通知，容易造成不必要的刷新。不支持跨页面(route)的状态，意思是跨树，如果不在一个树中，我们无法获取。数据是不可变的，必须结合StatefulWidget、ChangeNotifier或者Steam使用"),
              _textLine(
                  "3 NOtification 它是Flutter中跨层数据共享的一种机制，注意，它不是widget，它提供了dispatch方法，沿着context对应的Element节点向上逐层发送通知Notification缺点：不支持跨页面(route)的状态，准确说不支持NotificationListener同级或者父级Widget的状态通知。本身不支持刷新UI，需要结合State使用。如果结合State，会导致整个UI的重绘，效率底下不科学。 "),
              _headerLine("四 为什么要使用状态管理"),
              _textLine(
                  "对于不需要传递的状态或者不需要共享的状态，我们不需要进行复杂的状态管理，单纯依靠setState也可以很好的完成我们的需求。但是随着产品迭代节奏速度的加快，项目逐渐变得越来越庞大，不同组件之间的数据依赖性越来越高，我们就需要更清晰、明确的处理各个组件之间的数据关系，这时候如果还单单使用setState做状态处理，我们就很难明确的处理数据的流向，终可能会导致数据传递和嵌套逻辑过于复杂，不便于维护和管理，在出现问题的时候，也会花费大量的时间成本来捋清数据之间的关系。总的来说，对于跨组件（跨页面）之间进行数据共享和传递，而且需要保持状态的一致性和可维护性，这就需要我们对状态进行管理。"),
              _headerLine("五 常见的状态管理框架有哪些"),
              _headerLine("Provider"),
              _textLine(
                  "Provider是官方文档的例子用的方法. Google 比较推荐的用法. 和BLoC的流式思想相比, Provider是一个观察者模式, 状态改变时要notifyListeners().Provider的实现在内部还是利用了InheritedWidget，允许将有效信息传递到组件树下的小组件. Provider的好处: dispose指定后会自动被调用, 支持MultiProvider.Provider从名字上就很容易理解，它就是用于提供数据，无论是在单个页面还是在整个app 都有它自己的解决方案，可以很方便的管理状态。"),
              _headerLine("Redux"),
              _textLine("Redux是一种单向数据流架构，可以轻松开发，维护和测试应用程序，也是google推荐的状态管理方式。"),
              _textLine(
                  "所有的状态都存储在Store里。这个Store会放在根Widget.View拿到Store的状态数据会映射成视图渲染.Redux不直接让view操作数据，通过dispatch一个action通知Reducer,状态变更Reducer接收到这个action，根据action状态，生成新的状态，并替换在Store的旧状态.Store存储了新的状态后，就通知所有使用到了这个状态的View更新（类似setState）。这样我们就能够同步不同view中的状态了."),
              _headerLine("getX"),
              _textLine(
                  "高效的状态管理。便捷的路由管理。丰富的Api。之所以说GetX是高效的状态管理，是因为他不需要堆叠大量的控制、管理代码（如Action、middleware、reducer、state），而且不具有侵入性，可以降低业务和视图间的耦合度。在使用上，使用GetX的响应式状态管理就像使用setState一样简单（其实本质就是setState），并且GetX可以做到局部刷新。"),
            ],
          ),
        ));
  }
}

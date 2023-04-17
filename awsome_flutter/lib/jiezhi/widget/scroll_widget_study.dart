import 'dart:math';

import 'package:flutter/material.dart';

class ScrollWidgetDemoPage extends StatefulWidget {
  const ScrollWidgetDemoPage({super.key});

  @override
  State<ScrollWidgetDemoPage> createState() => _ScrollWidgetDemoPageState();
}

class _ScrollWidgetDemoPageState extends State<ScrollWidgetDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动组件的学习"),
      ),
      body: SWListenDemo(),
    );
  }
}

class SWListenDemo extends StatefulWidget {
  const SWListenDemo({super.key});

  @override
  State<SWListenDemo> createState() => _SWListenDemoState();
}

class _SWListenDemoState extends State<SWListenDemo> {
  // 设置一个controller
  ScrollController _controller = ScrollController(initialScrollOffset: 100);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 回到顶部可以 调用的方法
    // _controller.animateTo(0, duration: Duration(seconds: 2), curve: Curves.bounceIn);
    _controller.addListener(() {
      // 监听滚动的位置
      print("${_controller.offset}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (ScrollStartNotification notification) {
          // 当前滚动的位置 和 总长度
          final currentPixels = notification.metrics.pixels;
          final totalPixels = notification.metrics.maxScrollExtent;
          double progress = currentPixels / totalPixels;
          print("开始滚动了.....${progress} -- ${currentPixels}");

          return false;
        },
        child: ListView(
          // controller: _controller,
          children: List.generate(100, (index) {
            return ListTile(
              leading: Icon(Icons.time_to_leave),
              title: Text("---DiDi---"),
            );
          }),
        ));
  }
}

// sliver 详解

class SWCustomSliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 安全区域滚动
    return _demo2();
  }

  _demo1() {
    return CustomScrollView(
      // 设置内边距
      slivers: [
        // // 第一个部分
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverSafeArea(
              // 这个安全区域可以设置上下左右
              bottom: false,
              sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 16 / 18),
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return Container(
                      color: Color.fromARGB(255, Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256)),
                    );
                  }), childCount: 6))),
        ),

        // 第二个部分
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 16 / 18),
            delegate: SliverChildBuilderDelegate(((context, index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            }),
                // 一共多少个item
                childCount: 2)),

        //  第三个部分
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 16 / 18),
            delegate: SliverChildBuilderDelegate(((context, index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            }),
                // 一共多少个item
                childCount: 40)),
      ],
    );
  }

  _demo2() {
    return CustomScrollView(
      slivers: [
        // 用这个导航 上面的导航就可以删掉 这个导航可以随着内容滚动而滚动
        SliverAppBar(
          // 扩展一个高度 设置一个图片
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              title: Text("Helo"),
              background: Image.asset(
                "images/movie_1.png",
                fit: BoxFit.cover,
              )),

          // 是否随着内容滚动
          pinned: true,
        ),
        // 第一个是SliverGrid
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
              );
            }), childCount: 3),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1),
          ),
        ),
        // 第二个使用SliverList
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            leading: Icon(Icons.phone),
            title: Text("第---${index}-----行"),
          );
        }, childCount: 100))
      ],
    );
  }
}

// GridView 详解
class SWGridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _demo3();
  }

  _demo1() {
    return GridView(
        padding: EdgeInsets.only(left: 10, right: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 交叉轴的间距
            crossAxisSpacing: 10,
            // 主轴的间距
            mainAxisSpacing: 10,
            // 宽高比
            childAspectRatio: 16 / 18,
            // 交叉轴的个数
            crossAxisCount: 3),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        }));
  }

  _demo2() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      },
    );
  }

  _demo3() {
    return GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        }));
  }
}

// ListView 的详解
class SWListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _demo3();
  }

  _demo1() {
    return ListView(
      padding: EdgeInsets.all(10),
      itemExtent: 100,
      children: List.generate(100, (index) {
        return Text("data--${index}");
      }),
    );
  }

  _demo2() {
    return ListView.builder(
      itemExtent: 100,
      itemBuilder: (context, index) {
        return Text("data");
      },
    );
  }

  _demo3() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Text("data---${index}");
        },
        separatorBuilder: (context, index) {
          // 返回分割的区域 thickness 为线高
          return Divider(
            color: Colors.redAccent,
            height: 10,
            thickness: 10,
          );
        },
        itemCount: 100);
  }
}

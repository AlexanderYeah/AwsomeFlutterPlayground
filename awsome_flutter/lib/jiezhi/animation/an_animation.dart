import 'package:flutter/material.dart';

import '../../util/color.dart';

class AnimationDemoPage extends StatefulWidget {
  const AnimationDemoPage({super.key});

  @override
  State<AnimationDemoPage> createState() => _AnimationDemoPageState();
}
/*****---动画门-----***/

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with TickerProviderStateMixin {
  // 配置控制器
  AnimationController? _animationController;
  Animation<double>? _animation;
  Animation? _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    // 放大缩小的动画
    _animation =
        Tween<double>(begin: 25, end: 50).animate(_animationController!)
          ..addListener(() {
            print(_animation!.value);
            setState(() {});
          });
    // 颜色动画
    // TweenAnimationBuilder(tween: ColorTween(begin: Colors.redAccent, end: Colors.orangeAccent), duration: Duration(seconds: 3), builder: builder)
    _colorAnimation =
        ColorTween(begin: primaryColor[100], end: primaryColor[900])
            .animate(_animationController!)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              print("动画完成");
              _animationController!.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController!.forward();
            }
          });

    // 监听动画完成的时间
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("动画完成");
        // 点击reverse 之后 ，按钮又会缩小回去
        _animationController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController!.forward();
      }
    });

    startEasyAnimation();
  }

  // 开启动画
  void startEasyAnimation() {
    _animationController!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 销毁
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation"),
        ),
        body: Container(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(onPressed: () {}, child: Text("开始")),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                // 动画的值 作为size
                iconSize: _animation!.value,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: null,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                height: 100,
                color: _colorAnimation!.value,
              ),
            )
          ],
        )));
  }
}

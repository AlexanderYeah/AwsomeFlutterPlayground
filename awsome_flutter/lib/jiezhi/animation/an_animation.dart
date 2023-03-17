import 'package:awsome_flutter/service/screen_adapter.dart';
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
  // 大小
  Animation<double>? _animation;
  // 颜色
  Animation? _colorAnimation;
  // 位移
  Animation<Offset>? _offsetAnimation;
  // 圆角动画
  Animation<BorderRadius>? _radiusAnimation;
  // 字体样式动画
  Animation<TextStyle>? _textStyleAnimation;
  // decoration 动画
  Animation<Decoration>? _decorationAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    // 放大缩小的动画
    _animation =
        Tween<double>(begin: 25, end: 50).animate(_animationController!)
          ..addListener(() {
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
              _animationController!.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _animationController!.forward();
            }
          });
    // 位移动画
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(100, 100))
        .animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    // 圆角动画
    _radiusAnimation = Tween<BorderRadius>(
            begin: BorderRadius.circular(0), end: BorderRadius.circular(50))
        .animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    //字体样式动画
    _textStyleAnimation = TextStyleTween(
            begin: TextStyle(color: Colors.orange, fontSize: 15),
            end: TextStyle(color: Colors.redAccent, fontSize: 30))
        .animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    _decorationAnimation = DecorationTween(
            begin: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(5)),
            end: BoxDecoration(
                color: Colors.cyan, borderRadius: BorderRadius.circular(50)))
        .animate(_animationController!)
      ..addListener(() {
        setState(() {});
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
          width: ScreenAdapter.width(750),
          height: ScreenAdapter.height(1334),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              IconButton(
                // 动画的值 作为size
                iconSize: _animation!.value,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: null,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 80,
                height: 80,
                color: _colorAnimation!.value,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.cyan,
                margin: EdgeInsets.only(
                    left: _offsetAnimation!.value.dx,
                    top: _offsetAnimation!.value.dy),
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: _radiusAnimation!.value,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                child: Text("Stay Hungry,Stay Foolish",
                    style: _textStyleAnimation!.value),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: _decorationAnimation!.value,
              ),
            ],
          )),
    );
  }
}

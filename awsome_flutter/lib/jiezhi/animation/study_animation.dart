import 'dart:math';

import 'package:flutter/material.dart';

class StudyAnimationPage extends StatefulWidget {
  const StudyAnimationPage({super.key});

  @override
  State<StudyAnimationPage> createState() => _StudyAnimationPageState();
}

class _StudyAnimationPageState extends State<StudyAnimationPage>
    with SingleTickerProviderStateMixin {
  // 控制器
  AnimationController? _controller;
  CurvedAnimation? _curvedAnimation;
  // 动画
  Animation? _colorAnimation;
  // size 动画
  Animation<Size>? _sizeAnimation;
  // 透明度动画
  Animation<double>? _opacityAnimation;
  // 旋转动画
  Animation<double>? _rotationAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 这个this 必须在方法里面写才不报错
    //1  初始化控制器
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // 2 这里可以设置执行动画的速率
    _curvedAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOutCirc);

    // 3 动画
    _colorAnimation =
        ColorTween(begin: Colors.redAccent, end: Colors.blueAccent)
            .animate(_controller!)
          ..addListener(() {
            setState(() {});
          });
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller!.reverse();
    //   }
    // });
    _sizeAnimation =
        Tween(begin: Size(50, 50), end: Size(200, 200)).animate(_controller!);
    _opacityAnimation = Tween(begin: 0.3, end: 1.0).animate(_controller!);
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    print("build方法被调用了哈哈哈");
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // _demo1(),
          children: [
            SizedBox(
              height: 150,
            ),
            // _demo2()
            // _demo3(),
            _demo4()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller!.forward();
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  _demo1() {
    return Container(
      color: _colorAnimation!.value,
      width: 100,
      height: 100,
    );
  }

  // _demo2() {
  //   return Container(
  //     width: _sizeAnimation!.value.width,
  //     height: _sizeAnimation!.value.height,
  //     color: Colors.blueAccent,
  //   );
  // }
  // _demo2() {
  //   return MyAnimatedBox(_sizeAnimation!);
  // }

  _demo3() {
    return AnimatedBuilder(
      animation: _sizeAnimation!,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: _sizeAnimation!.value.width,
          height: _sizeAnimation!.value.height,
          color: Colors.blueAccent,
        );
      },
    );
  }

  // 交织动画
  /**
   * 多个动画交织在一起
   * 1 大小变化的动画
   * 2 颜色变化的动画
   * 3 透明度变化的动画
   * 4 旋转的动画
   * 
  */
  _demo4() {
    return Opacity(
      opacity: _opacityAnimation!.value,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(_rotationAnim!.value),
        child: Container(
          color: _colorAnimation!.value,
          width: _sizeAnimation!.value.width,
          height: _sizeAnimation!.value.height,
        ),
      ),
    );
  }
}

class MyAnimatedBox extends AnimatedWidget {
  // 这里传递 一个animation 过来 传递给父类
  MyAnimatedBox(Animation anim) : super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    Animation sizeAnimation = listenable as Animation;
    // TODO: implement build
    return Container(
      width: sizeAnimation.value.width,
      height: sizeAnimation.value.height,
      color: Colors.blueAccent,
    );
  }
}

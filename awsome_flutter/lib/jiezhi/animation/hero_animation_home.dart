import 'package:awsome_flutter/jiezhi/animation/hero_image_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HeroAnimationPageDemo extends StatefulWidget {
  const HeroAnimationPageDemo({super.key});

  @override
  State<HeroAnimationPageDemo> createState() => _HeroAnimationPageDemoState();
}

class _HeroAnimationPageDemoState extends State<HeroAnimationPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero 动画"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 16 / 9),
        itemBuilder: (context, index) {
          final String imageUrl =
              "https://picsum.photos/200/300?random=${index}";
          return GestureDetector(
              onTap: () {
                // 点击事件
                // 这里点击的时候包裹一个动画 那么就没有Push 的画面感觉
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: HeroImageDetail(imageUrl),
                    );
                  },
                ));
              },
              child: Hero(
                tag: imageUrl,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GlobalKeyDemoPage extends StatefulWidget {
  const GlobalKeyDemoPage({super.key});

  @override
  State<GlobalKeyDemoPage> createState() => _GlobalKeyDemoPageState();
}

class _GlobalKeyDemoPageState extends State<GlobalKeyDemoPage> {
  final GlobalKey<_GKDContentPageState> contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: GKDContentPage(key: contentKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 获取其name 的值
          print("${contentKey.currentState!.widget.name}");
          // 获取其message 的值
          print("${contentKey.currentState!.message}");
          print("${contentKey.currentContext}");
          // 这里可以通过currentContext 找到findRenderObject RenderBox属性里面
          RenderBox? renderObj =
              contentKey.currentContext?.findRenderObject() as RenderBox;
          print(renderObj.size);
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class GKDContentPage extends StatefulWidget {
  final String name = "everything will be fine !!!";
  const GKDContentPage({super.key});

  @override
  State<GKDContentPage> createState() => _GKDContentPageState();
}

class _GKDContentPageState extends State<GKDContentPage> {
  final String message = "just do right things !!!";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("GKDContentPage"),
    );
  }
}

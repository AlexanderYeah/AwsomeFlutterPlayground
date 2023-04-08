import 'package:flutter/material.dart';

class FutureDemoPage extends StatefulWidget {
  const FutureDemoPage({super.key});

  @override
  State<FutureDemoPage> createState() => _FutureDemoPageState();
}

class _FutureDemoPageState extends State<FutureDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无状态组件"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}

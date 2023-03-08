import 'package:flutter/material.dart';

class YongQiPage extends StatefulWidget {
  const YongQiPage({super.key});

  @override
  State<YongQiPage> createState() => _YongQiPageState();
}

class _YongQiPageState extends State<YongQiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("勇气"),
      ),
      body: Text("勇气"),
    );
  }
}

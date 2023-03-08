import 'package:flutter/material.dart';

class QinMianPage extends StatefulWidget {
  const QinMianPage({super.key});

  @override
  State<QinMianPage> createState() => _QinMianPageState();
}

class _QinMianPageState extends State<QinMianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("勤勉"),
      ),
      body: Text("勤勉"),
    );
  }
}

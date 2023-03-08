import 'package:flutter/material.dart';

class PingJingPage extends StatefulWidget {
  const PingJingPage({super.key});

  @override
  State<PingJingPage> createState() => _PingJingPageState();
}

class _PingJingPageState extends State<PingJingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("平静"),
      ),
      body: Text("平静"),
    );
  }
}

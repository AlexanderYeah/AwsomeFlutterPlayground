import 'package:flutter/material.dart';

class JieZhiPage extends StatefulWidget {
  const JieZhiPage({super.key});

  @override
  State<JieZhiPage> createState() => _JieZhiPageState();
}

class _JieZhiPageState extends State<JieZhiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("节制"),
      ),
      body: Text("节制"),
    );
  }
}

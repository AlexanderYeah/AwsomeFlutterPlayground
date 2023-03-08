import 'package:flutter/material.dart';
import 'jieZhi.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.heat_pump), label: "节制"),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "勤勉"),
            BottomNavigationBarItem(icon: Icon(Icons.boy_rounded), label: "决心"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat_rounded), label: "勇气"),
            BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "平静"),
          ]),
      body: JieZhiPage(),
    );
  }
}

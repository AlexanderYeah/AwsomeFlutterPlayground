import 'package:flutter/material.dart';
import 'jieZhi.dart';
import 'qinMian.dart';
import 'jueXin.dart';
import 'yongQi.dart';
import 'pingJing.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  List _pages = [
    JieZhiPage(),
    QinMianPage(),
    JueXinPage(),
    YongQiPage(),
    PingJingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (idx) {
            setState(() {
              _selectedIndex = idx;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.heat_pump), label: "节制"),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "勤勉"),
            BottomNavigationBarItem(icon: Icon(Icons.boy_rounded), label: "决心"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat_rounded), label: "勇气"),
            BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "平静"),
          ]),
      body: _pages[_selectedIndex],
    );
  }
}

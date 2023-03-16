import 'package:flutter/material.dart';

// 如何定义 可以参考Colors.blue 系统是如何定义的
// 主色
const MaterialColor primaryColor = MaterialColor(
  0xFF2196F3,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
// 白色
const MaterialColor whiteColor = const MaterialColor(0xFFFFFFFF, <int, Color>{
  50: const Color(0xffffffff),
  100: const Color(0xffffffff),
  200: const Color(0xffffffff),
  300: const Color(0xffffffff),
  400: const Color(0xffffffff),
  500: const Color(0xffffffff),
  600: const Color(0xffffffff),
  700: const Color(0xffffffff),
  800: const Color(0xffffffff),
  900: const Color(0xffffffff)
});

import 'package:flutter/material.dart';
import '../tabs/jieZhi.dart';
import '../tabs/qinMian.dart';
import '../tabs/pingJing.dart';
import '../tabs/jueXin.dart';
import '../tabs/yongQi.dart';
import '../jiezhi/animation/animation.dart';
import '../jiezhi/animation/an_animation.dart';
import '../jiezhi/storage/storage.dart';
import '../jiezhi/storage/sto_share_preference.dart';

//配置路由
final routes = {
  '/': (context) => Tab(),
  '/jiezhi': (context) => JieZhiPage(),
  '/qinmian': (context) => QinMianPage(),
  '/juexin': (context) => JueXinPage(),
  '/yongqi': (context) => YongQiPage(),
  '/pingjing': (context) => PingJingPage(),
  '/animation': (context) => AnimationPage(),
  '/an_animation': (context) => AnimationDemoPage(),
  '/storage': (context) => StoragePage(),
  '/sto_share_preference': (context) => SharePreferenceDemoPage(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};

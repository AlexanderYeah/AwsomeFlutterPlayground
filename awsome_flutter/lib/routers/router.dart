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
import '../jiezhi/widget/widget_list.dart';
import '../jiezhi/widget/text_demo.dart';
import '../jiezhi/widget/button_demo.dart';
import '../jiezhi/state/state_list.dart';
import '../jiezhi/state/noti_page_a.dart';
import '../jiezhi/state/noti_page_b.dart';
import '../juexin/dart/dart_list.dart';
import '../juexin/dart/dart_single_thread.dart';
import '../juexin/dart/dart_future_stream.dart';
import '../jiezhi/state/provider_page_a.dart';
import '../juexin/widget/widget_list.dart';
import '../juexin/widget/widget_state_life_cycle.dart';
import '../juexin/widget/widget_state_manage.dart';
import '../jiezhi/state/get_x_demo.dart';
import '../jiezhi/state/get_x_son.dart';
import '../jiezhi/internationalAndTheme/theme_list.dart';
import '../jiezhi/internationalAndTheme/international_demo.dart';

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
  '/widget_list': (context) => WidgetListPage(),
  '/text_demo': (context) => TextDemoPage(),
  '/button_demo': (context) => ButtonDemoPage(),
  '/state_list': (context) => StateListPage(),
  '/noti_page_a': (context) => NotiPageDemoA(),
  '/noti_page_b': (context) => NotiPageDemoB(),
  '/dart_list': (context) => DartListPage(),
  '/dart_single_thread': (context) => SingleThreadPage(),
  '/dart_future_stream': (context) => DartFutureAndStreamPage(),
  '/provider_page_a': (context) => ProviderPageA(),
  '/widget_list': (context) => JXWidgetListPage(),
  '/widget_state_life_cycle': (context) => StateLifeCyclePage(),
  '/widget_state_manage': (context) => StateManagePage(),
  '/get_x_demo': (context) => GetXDemoPage(),
  '/get_x_son': (context) => GetXSonDemoPage(),
  '/theme_list': (context) => ThemeListPage(),
  '/international_demo': (context) => InternationDemoPage(),
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

import 'package:awsome_flutter/jiezhi/state/count_provider.dart';
import 'package:awsome_flutter/routers/route_pages.dart';
import 'package:awsome_flutter/service/app_translation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './tabs/tab.dart';
import './routers/router.dart';
import 'package:get/get.dart';

import 'jiezhi/state/userinfo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => UserInfoProvider())
        ],
        child: GetMaterialApp(
          title: "DDDD",
          getPages: RoutePages,
          // 设置过渡动画
          defaultTransition: Transition.fade,
          // 设置默认语言
          locale: Locale('zh', 'EN'),
          // 配置错误的情况下使用的语言
          fallbackLocale: Locale('zh', 'EN'),
          // 这个是翻译的关键 跟据translationsKeys来进行自定义的内容进行翻译
          translationsKeys: AppTranslation.translation,
          home: Tabs(),
          initialRoute: "/",
        ));
  }
}

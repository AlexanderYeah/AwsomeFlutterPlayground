import 'package:awsome_flutter/jiezhi/camera/camera.dart';
import 'package:awsome_flutter/juexin/widget/widget_communicate_device.dart';
import 'package:awsome_flutter/tabs/pingJing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awsome_flutter/tabs/jieZhi.dart';
import 'package:awsome_flutter/tabs/jueXin.dart';
import 'package:awsome_flutter/tabs/qinMian.dart';
import 'package:awsome_flutter/tabs/yongQi.dart';
import 'package:awsome_flutter/jiezhi/route/route_manage_list.dart';
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
import '../juexin/widget/widget_h5.dart';
import '../juexin/widget/widget_list.dart';
import '../juexin/widget/widget_state_life_cycle.dart';
import '../juexin/widget/widget_state_manage.dart';
import '../jiezhi/state/get_x_demo.dart';
import '../jiezhi/state/get_x_son.dart';
import '../jiezhi/internationalAndTheme/theme_list.dart';
import '../jiezhi/internationalAndTheme/international_demo.dart';
import '../juexin/researchKey/research_key_list.dart';
import '../juexin/researchKey/rk_normal_key.dart';
import '../juexin/researchKey/rk_widget_element.dart';
import '../juexin/researchKey/rk_global_key.dart';
import '../yongqi/animatedList/animated_cell_list.dart';
import '../yongqi/movieCard/movie_card_page.dart';

List<GetPage<dynamic>> RoutePages = [
  GetPage(name: "/", page: () => Tab()),
  GetPage(name: "/jiezhi", page: () => JieZhiPage()),
  GetPage(
    name: '/qinmian',
    page: () => QinMianPage(),
  ),
  GetPage(
    name: '/juexin',
    page: () => JueXinPage(),
  ),
  GetPage(name: "/yongqi", page: () => YongQiPage()),
  GetPage(
    name: '/route_manage_list',
    page: () => RouteManageListPage(),
  ),
  GetPage(
    name: '/pingjing',
    page: () => PingJingPage(),
  ),
  GetPage(
    name: '/animation',
    page: () => AnimationPage(),
  ),
  GetPage(
    name: '/an_animation',
    page: () => AnimationDemoPage(),
  ),
  GetPage(
    name: '/storage',
    page: () => StoragePage(),
  ),
  GetPage(
    name: '/sto_share_preference',
    page: () => SharePreferenceDemoPage(),
  ),
  GetPage(
    name: '/widget_list',
    page: () => JXWidgetListPage(),
  ),
  GetPage(
    name: '/route_manage_list',
    page: () => RouteManageListPage(),
  ),
  GetPage(
    name: '/text_demo',
    page: () => TextDemoPage(),
  ),
  GetPage(
    name: '/button_demo',
    page: () => ButtonDemoPage(),
  ),
  GetPage(
    name: '/state_list',
    page: () => StateListPage(),
  ),
  GetPage(
    name: '/noti_page_a',
    page: () => NotiPageDemoA(),
  ),
  GetPage(
    name: '/noti_page_b',
    page: () => NotiPageDemoB(),
  ),
  GetPage(
    name: '/dart_list',
    page: () => DartListPage(),
  ),
  GetPage(
    name: '/dart_single_thread',
    page: () => SingleThreadPage(),
  ),
  GetPage(
    name: '/dart_list',
    page: () => DartListPage(),
  ),
  GetPage(
    name: '/dart_future_stream',
    page: () => DartFutureAndStreamPage(),
  ),
  GetPage(
    name: '/provider_page_a',
    page: () => ProviderPageA(),
  ),
  GetPage(
    name: '/widget_state_life_cycle',
    page: () => StateLifeCyclePage(),
  ),
  GetPage(
    name: '/widget_state_manage',
    page: () => StateManagePage(),
  ),
  GetPage(
    name: '/get_x_demo',
    page: () => GetXDemoPage(),
  ),
  GetPage(
    name: '/get_x_son',
    page: () => GetXSonDemoPage(),
  ),
  GetPage(
    name: '/theme_list',
    page: () => ThemeListPage(),
  ),
  GetPage(
    name: '/international_demo',
    page: () => InternationDemoPage(),
  ),
  GetPage(
    name: '/research_key_list',
    page: () => ResearchKeyListPage(),
  ),
  GetPage(
    name: '/rk_normal_key',
    page: () => RKNormalKeyPage(),
  ),
  GetPage(
    name: '/rk_widget_element',
    page: () => RKWidgetAndElement(),
  ),
  GetPage(
    name: '/rk_global_key',
    page: () => RKGlobalKeyPage(),
  ),
  GetPage(
    name: '/movie_card_page',
    page: () => MovieCardPage(),
  ),
  GetPage(
    name: '/communicate_html',
    page: () => CommunicateHTMLPage(),
  ),
  GetPage(
    name: '/communicate_device',
    page: () => CommunicateDevicePage(),
  ),
  GetPage(
    name: '/camera',
    page: () => CameraPage(),
  ),
  GetPage(
    name: '/movie_card_demo',
    page: () => MovieCardPage(),
  ),
  GetPage(
    name: '/animated_cell_list',
    page: () => AnimatedListCellPage(),
  ),
];

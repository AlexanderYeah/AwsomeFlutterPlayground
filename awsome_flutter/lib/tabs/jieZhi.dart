import 'package:awsome_flutter/http/core/sk_error.dart';
import 'package:awsome_flutter/util/color.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../http/core/sk_net.dart';
import '../http/request/test_request.dart';
import '../db/sk_cache.dart';
import '../service/screen_adapter.dart';
import '../jiezhi/localData/jz_local_data.dart';
import '../widget/jz_list_item.dart';
import 'package:get/get.dart';

class JieZhiPage extends StatefulWidget {
  const JieZhiPage({super.key});

  @override
  State<JieZhiPage> createState() => _JieZhiPageState();
}

class _JieZhiPageState extends State<JieZhiPage> {
  List _contentList = [];
  @override
  void initState() {
    super.initState();
    // 一定要预先初始化
    skcachePreInit();
    _loadData();
  }

  // 加载列表数据
  _loadData() {
    _contentList = jz_content_data;
    setState(() {});
  }

  skcachePreInit() async {
    await SKCache.preInit();
  }

  loadData() async {
    TestRequest req = TestRequest();
    req.add("uri", "/taoHuoSelectList");
    try {
      var result = await SKNet.getInstance().fire(req);
      print(result);
    } on NeedAuth catch (error) {
      print(error);
    } on NeedLogin catch (error) {
      print(error);
    } on SKNetError catch (error) {
      print(error);
    }
  }

  _cardItem(index, title, content) {
    return JZListItem(index, title, content, (index) {
      var targetRoute = "";
      switch (index) {
        case 0:
          targetRoute = "/basic_grammar";
          break;
        case 1:
          targetRoute = "/widget_list";
          break;
        case 2:
          targetRoute = "/state_list";
          break;
        case 3:
          targetRoute = "/event_list";
          break;
        case 4:
          targetRoute = "/route_manage_list";
          break;
        case 5:
          targetRoute = "/animation";
          break;
        case 7:
          targetRoute = "/storage";
          break;
        case 8:
          targetRoute = "/camera";
          break;
        case 9:
          targetRoute = "/theme_list";
          break;
        default:
          break;
      }
      if (targetRoute.length != 0) Get.toNamed(targetRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 初始化
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("节制"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _contentList.length,
          itemBuilder: (BuildContext context, int index) {
            return _cardItem(index, _contentList[index]["title"],
                _contentList[index]["content"]);
          },
        ),
      ),
    );
  }
}

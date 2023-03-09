import 'package:awsome_flutter/http/core/sk_error.dart';
import 'package:flutter/material.dart';
import '../http/core/sk_net.dart';
import '../http/request/test_request.dart';
import '../db/sk_cache.dart';

class JieZhiPage extends StatefulWidget {
  const JieZhiPage({super.key});

  @override
  State<JieZhiPage> createState() => _JieZhiPageState();
}

class _JieZhiPageState extends State<JieZhiPage> {
  @override
  void initState() {
    super.initState();
    // 一定要预先初始化
    skcachePreInit();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("节制"),
      ),
      body: InkWell(
        onTap: () {
          // 点击
          SKCache.getInstance().setString("Name", "Leonardo");

          var value = SKCache.getInstance().get("Name");
          print(value);
        },
        child: Container(
          child: Center(child: Text("点")),
        ),
      ),
    );
  }
}

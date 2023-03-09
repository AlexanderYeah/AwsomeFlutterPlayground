import 'package:awsome_flutter/http/core/sk_error.dart';
import 'package:flutter/material.dart';
import '../http/core/sk_net.dart';
import '../http/request/test_request.dart';

class JieZhiPage extends StatefulWidget {
  const JieZhiPage({super.key});

  @override
  State<JieZhiPage> createState() => _JieZhiPageState();
}

class _JieZhiPageState extends State<JieZhiPage> {
  @override
  void initState() {
    super.initState();
  }

  loadData() async {
    TestRequest req = TestRequest();
    req.add("name", "leonardo").add("nickname", "wolf");

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
          loadData();
        },
        child: Container(
          child: Center(child: Text("点")),
        ),
      ),
    );
  }
}

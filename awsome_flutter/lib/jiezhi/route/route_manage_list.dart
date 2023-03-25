import 'package:awsome_flutter/widget/tips_dailog.dart';
import 'package:flutter/material.dart';
import '../../jiezhi/localData/jz_local_data.dart';
import '../../widget/jz_list_item.dart';
import 'package:get/get.dart';

class RouteManageListPage extends StatefulWidget {
  const RouteManageListPage({super.key});

  @override
  State<RouteManageListPage> createState() => _RouteManageListPageState();
}

class _RouteManageListPageState extends State<RouteManageListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由管理 🤔🤔🤔"),
      ),
      body: ListView.builder(
        itemCount: jz_route_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(
            index,
            jz_route_data[index]["title"],
            jz_route_data[index]["content"],
            (idx) {
              var targetRoute = jz_route_data[index]["route"];
              if (targetRoute.length > 0) Get.toNamed(targetRoute);
            },
            tipsClick: (idx) {
              TipsDialog(jz_route_data[index]["title"],
                      jz_route_data[index]["tips"], context)
                  .openAlertDialog();
            },
          );
        },
      ),
    );
  }
}

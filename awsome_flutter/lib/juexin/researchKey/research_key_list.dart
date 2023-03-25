import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../widget/jz_list_item.dart';
import '../../widget/tips_dailog.dart';
import '../localData/juexin_local_data.dart';
import 'package:get/get.dart';

class ResearchKeyListPage extends StatefulWidget {
  const ResearchKeyListPage({super.key});

  @override
  State<ResearchKeyListPage> createState() => _ResearchKeyListPageState();
}

class _ResearchKeyListPageState extends State<ResearchKeyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: jx_reseach_key_list_data.length,
          itemBuilder: (BuildContext context, int index) {
            return JZListItem(
              index,
              jx_reseach_key_list_data[index]["title"],
              jx_reseach_key_list_data[index]["content"],
              (idx) {
                String route = jx_reseach_key_list_data[idx]["route"];
                if (route.length > 0) Get.toNamed(route);
              },
              tipsClick: (idx) {
                TipsDialog(jx_widget_list_data[index]["title"],
                    jx_widget_list_data[index]["tips"], context);
              },
            );
          },
        ),
      ),
    );
  }
}

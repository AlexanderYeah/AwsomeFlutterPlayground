import 'package:awsome_flutter/widget/jx_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/instance_manager.dart';
import '../juexin/localData/juexin_local_data.dart';
import 'dart:math';
import 'package:get/get.dart';

class JueXinPage extends StatefulWidget {
  const JueXinPage({super.key});

  @override
  State<JueXinPage> createState() => _JueXinPageState();
}

class _JueXinPageState extends State<JueXinPage> {
  _itemWidget(index, title, content) {
    return JXListItem(index, title, content, (idx) {
      var targetRoute = jx_list_data[idx - 1]["route"];
      if (targetRoute.length != 0) Get.toNamed(targetRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("决心"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: MasonryGridView.count(
          itemCount: jx_list_data.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return _itemWidget(index + 1, jx_list_data[index]["title"],
                jx_list_data[index]["content"]);
          },
        ),
      ),
    );
  }
}

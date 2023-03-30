import 'package:awsome_flutter/yongqi/localData/yq_local_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/jz_list_item.dart';
import '../yongqi/movieCard/movie_card_page.dart';

class YongQiPage extends StatefulWidget {
  const YongQiPage({super.key});
  @override
  State<YongQiPage> createState() => _YongQiPageState();
}

class _YongQiPageState extends State<YongQiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("勇气"),
      ),
      body: ListView.builder(
        itemCount: yq_list_data.length,
        itemBuilder: (BuildContext context, int index) {
          return _cardItem(index, yq_list_data[index]["title"],
              yq_list_data[index]["content"]);
        },
      ),
    );
  }

  _cardItem(index, title, content) {
    return JZListItem(index, title, content, (index) {
      var targetRoute = "";
      targetRoute = yq_list_data[index]["route"];
      if (targetRoute.length != 0) Get.toNamed(targetRoute);
    });
  }
}

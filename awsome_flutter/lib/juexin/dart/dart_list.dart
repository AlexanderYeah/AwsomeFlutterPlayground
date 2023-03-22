import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../juexin/localData/juexin_local_data.dart';
import 'dart:math';
import '../../widget/jx_list_item.dart';

class DartListPage extends StatefulWidget {
  const DartListPage({super.key});
  @override
  State<DartListPage> createState() => _DartListPageState();
}

class _DartListPageState extends State<DartListPage> {
  _changeName(name) {
    return name = "fibonacci";
  }

  _changeList(names) {
    names[0] = "kkkkk";
  }

  _itemWidget(index, title, content) {
    return JXListItem(index, title, content, (idx) {
      // dart值传递还是引用传递
      String name = "leonardo";
      // name的值不会被改变
      _changeName(name);
      // list的值会被改变
      List names = ["leo", "tom", "jerry"];
      _changeList(names);

      var targetRoutes = "";
      switch (idx) {
        case 3:
          targetRoutes = "/dart_single_thread";
          break;
        case 5:
          targetRoutes = "/dart_future_stream";
          break;
        default:
      }
      Navigator.of(context).pushNamed(targetRoutes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: MasonryGridView.count(
          itemCount: jx_dart_list_data.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            return _itemWidget(index + 1, jx_dart_list_data[index]["title"],
                jx_dart_list_data[index]["content"]);
          },
        ),
      ),
    );
  }
}

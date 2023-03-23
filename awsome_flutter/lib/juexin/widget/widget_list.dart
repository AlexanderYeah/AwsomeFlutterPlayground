import 'package:awsome_flutter/widget/jz_list_item.dart';
import 'package:flutter/material.dart';
import '../../juexin/localData/juexin_local_data.dart';

class JXWidgetListPage extends StatefulWidget {
  const JXWidgetListPage({super.key});

  @override
  State<JXWidgetListPage> createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<JXWidgetListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: jx_widget_list_data.length,
          itemBuilder: (BuildContext context, int index) {
            return JZListItem(index, jx_widget_list_data[index]["title"],
                jx_widget_list_data[index]["content"], (idx) {
              String route = jx_widget_list_data[index]["route"];
              if (route.length > 0) Navigator.of(context).pushNamed(route);
            });
          },
        ),
      ),
    );
  }
}

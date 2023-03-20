import 'package:flutter/material.dart';
import '../../widget/jz_list_item.dart';
import '../../jiezhi/localData/jz_local_data.dart';

class WidgetListPage extends StatefulWidget {
  const WidgetListPage({super.key});

  @override
  State<WidgetListPage> createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Widget 🚪"),
      ),
      body: ListView.builder(
        itemCount: jz_widget_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(index, jz_widget_data[index]["title"],
              jz_widget_data[index]["content"], (idx) {
            var targetRoute = "";
            switch (idx) {
              case 0:
                targetRoute = "/text_demo";
                break;
              default:
            }
            Navigator.of(context).pushNamed(targetRoute);
          });
        },
      ),
    );
  }
}

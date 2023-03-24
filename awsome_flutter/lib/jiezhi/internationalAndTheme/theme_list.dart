import 'package:awsome_flutter/widget/tips_dailog.dart';
import 'package:flutter/material.dart';
import '../../widget/jz_list_item.dart';
import '../../jiezhi/localData/jz_local_data.dart';

class ThemeListPage extends StatefulWidget {
  const ThemeListPage({super.key});
  @override
  State<ThemeListPage> createState() => _ThemeListPageState();
}

class _ThemeListPageState extends State<ThemeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题与国际化"),
      ),
      body: ListView.builder(
        itemCount: jz_theme_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(
            index,
            jz_theme_data[index]["title"],
            jz_theme_data[index]["content"],
            (idx) {
              var targetRoute = jz_theme_data[index]["route"];
              if (targetRoute.length > 0)
                Navigator.of(context).pushNamed(targetRoute);
            },
            tipsClick: (idx) {
              TipsDialog(jz_theme_data[index]["title"],
                      jz_theme_data[index]["tips"], context)
                  .openAlertDialog();
            },
          );
        },
      ),
    );
  }
}

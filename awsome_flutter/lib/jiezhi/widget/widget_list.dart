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
            var targetRoute = jz_widget_data[index]["route"];
            Navigator.of(context).pushNamed(targetRoute);
          });
        },
      ),
    );
  }
}

class DemoWidget extends StatefulWidget {
  const DemoWidget({super.key});

  @override
  State<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  @override
  void initState() {
    // 这里必须要调用 super, 父类方法上方有一个关键字 @mustCallSuper
    super.initState();
    print("DemoWidgetState-initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("DemoWidgetState-didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("DemoWidgetState-build");
    return Container();
  }
}

import 'package:awsome_flutter/widget/tips_dailog.dart';
import 'package:flutter/material.dart';
import '../../jiezhi/localData/jz_local_data.dart';
import '../../widget/jz_list_item.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State 🤔🤔🤔"),
      ),
      body: ListView.builder(
        itemCount: jz_event_list_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(
            index,
            jz_event_list_data[index]["title"],
            jz_event_list_data[index]["content"],
            (idx) {
              var targetRoute = jz_event_list_data[index]["route"];

              Navigator.of(context).pushNamed(targetRoute);
            },
            tipsClick: (idx) {
              TipsDialog(jz_event_list_data[index]["title"],
                      jz_event_list_data[index]["tips"], context)
                  .openAlertDialog();
            },
          );
        },
      ),
    );
  }
}

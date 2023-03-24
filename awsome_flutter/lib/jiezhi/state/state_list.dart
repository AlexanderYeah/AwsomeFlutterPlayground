import 'package:awsome_flutter/widget/tips_dailog.dart';
import 'package:flutter/material.dart';
import '../../jiezhi/localData/jz_local_data.dart';
import '../../widget/jz_list_item.dart';

class StateListPage extends StatefulWidget {
  const StateListPage({super.key});

  @override
  State<StateListPage> createState() => _StateListPageState();
}

class _StateListPageState extends State<StateListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State 🤔🤔🤔"),
      ),
      body: ListView.builder(
        itemCount: jz_state_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(
            index,
            jz_state_data[index]["title"],
            jz_state_data[index]["content"],
            (idx) {
              var targetRoute = jz_state_data[index]["route"];

              Navigator.of(context).pushNamed(targetRoute);
            },
            tipsClick: (idx) {
              TipsDialog(jz_state_data[index]["title"],
                      jz_state_data[index]["tips"], context)
                  .openAlertDialog();
            },
          );
        },
      ),
    );
  }
}

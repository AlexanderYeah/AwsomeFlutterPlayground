import 'package:flutter/material.dart';
import '../../widget/jz_list_item.dart';
import '../../jiezhi/localData/jz_local_data.dart';
import '../../widget/tips_dailog.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});
  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation"),
        ),
        body: ListView.builder(
          itemCount: jz_Animation_data.length,
          itemBuilder: ((context, index) {
            return JZListItem(
              index,
              jz_Animation_data[index]["title"],
              jz_Animation_data[index]["content"],
              (value) {
                String targetRoute = jz_Animation_data[value]["route"];
                Navigator.of(context).pushNamed(targetRoute);
              },
              tipsClick: (idx) {
                print(idx);
                var content = jz_Animation_data[idx]["content"] +
                    "\n" +
                    jz_Animation_data[idx]["tips"];

                TipsDialog(jz_Animation_data[idx]["title"], content, context)
                    .openAlertDialog();
              },
            );
          }),
        ));
  }
}

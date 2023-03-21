import 'package:awsome_flutter/jiezhi/state/noti_page_b.dart';
import 'package:flutter/material.dart';

class NotiPageDemoTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        // 通过context 向上传递
        onPressed: () {
          MyNotification("this message is come from son widget")
              .dispatch(context);
        },
        child: Text("data"));
  }
}

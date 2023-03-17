import 'package:flutter/material.dart';

enum AlertOption { Ok, Cancel }

class TipsDialog {
  String title;
  String content;
  BuildContext? context;
  TipsDialog(this.title, this.content, this.context);

  openAlertDialog() async {
    final alertOption = await showDialog(
        context: context!,
        builder: (BuildContext context) {
          return AlertDialog(
            // 设置内容可以滚动
            scrollable: true,
            // 标题
            title: Text(
              this.title,
              style: TextStyle(color: Colors.red),
            ),
            // 内容
            content: Text(this.content),
            // 动作
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(AlertOption.Cancel);
                  },
                  child: Text("Close")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(AlertOption.Ok);
                  },
                  child: Text("Ok"))
            ],
          );
        });
    print(alertOption);
  }
}

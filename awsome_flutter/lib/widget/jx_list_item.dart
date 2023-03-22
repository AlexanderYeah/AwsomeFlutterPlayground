import 'package:flutter/material.dart';

class JXListItem extends StatelessWidget {
  final ValueChanged<int> callBackClick;
  final int index;
  final String title;
  final String content;
  const JXListItem(this.index, this.title, this.content, this.callBackClick,
      {super.key});

  _itemWidget() {
    List colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.cyanAccent,
      Colors.green
    ];
    return GestureDetector(
      onTap: () {
        callBackClick(index);
      },
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(5)),
          child: Container(
            child: Column(
              children: [
                Text(
                  "${index} " + "${title}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(content,
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _itemWidget();
  }
}

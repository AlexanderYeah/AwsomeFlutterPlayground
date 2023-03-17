import 'package:flutter/material.dart';
import '../service/screen_adapter.dart';
import '../util/color.dart';

class JZListItem extends StatelessWidget {
  final ValueChanged<int> callBackClick;
  final ValueChanged<int>? tipsClick;
  final int index;
  final String title;
  final String content;
  const JZListItem(this.index, this.title, this.content, this.callBackClick,
      {super.key, this.tipsClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackClick(index);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: ScreenAdapter.height(160),
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: primaryColor[400],
          borderRadius: BorderRadius.circular(ScreenAdapter.width(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${index + 1}",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenAdapter.fontSize(85)),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenAdapter.height(20),
                ),
                Container(
                    height: ScreenAdapter.height(50),
                    width: ScreenAdapter.width(750 - 60 - 80 - 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenAdapter.fontSize(40)),
                        ),
                        IconButton(
                            onPressed: () {
                              if (tipsClick != null) tipsClick!(index);
                            },
                            icon: Icon(
                              Icons.help_outline,
                              color: Colors.white,
                            ))
                      ],
                    )),
                SizedBox(
                  height: ScreenAdapter.height(5),
                ),
                Container(
                  width: ScreenAdapter.width(750 - 60 - 80 - 80),
                  height: ScreenAdapter.height(80),
                  child: Text(
                    content,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenAdapter.fontSize(28)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

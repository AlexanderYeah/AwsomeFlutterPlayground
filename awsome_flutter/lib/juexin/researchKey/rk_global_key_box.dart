import 'package:flutter/material.dart';

class RKGlobalKeyBox extends StatefulWidget {
  final Color color;

  const RKGlobalKeyBox(this.color, {Key? key}) : super(key: key);

  @override
  _RKGlobalKeyBoxState createState() => _RKGlobalKeyBoxState();
}

class _RKGlobalKeyBoxState extends State<RKGlobalKeyBox> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        color: widget.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$count', style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: Icon(Icons.add),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class RKNormalKeyContainerA extends StatefulWidget {
  final Color color;
  const RKNormalKeyContainerA(this.color, {Key? key}) : super(key: key);
  // const RKNormalKeyContainerA({super.key, required this.color});
  @override
  State<RKNormalKeyContainerA> createState() => _RKNormalKeyContainerAState();
}

class _RKNormalKeyContainerAState extends State<RKNormalKeyContainerA> {
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

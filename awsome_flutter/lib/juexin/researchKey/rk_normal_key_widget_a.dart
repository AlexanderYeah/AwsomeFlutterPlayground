import 'package:flutter/material.dart';

class RKNormalKeyContainerA extends StatefulWidget {
  final String name;
  const RKNormalKeyContainerA(this.name, {Key? key}) : super(key: key);
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
        color: Colors.cyan,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.name}"),
            Text('$count', style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              icon: Icon(Icons.add),
            ),
            Divider(
              height: 1,
            ),
          ],
        ));
  }
}

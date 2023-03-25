import 'package:flutter/material.dart';

class Edit {
  static Edit? _instance;

  static instance() {
    if (_instance == null) {
      return Edit();
    }
    return _instance!;
  }

  Widget text(content) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("\n ${content}")
      ],
    );
  }

  Widget header(title) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("\n ${title}",
            style: TextStyle(fontSize: 20, color: Colors.blueAccent))
      ],
    );
  }
}

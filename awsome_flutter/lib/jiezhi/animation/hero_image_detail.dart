import 'package:flutter/material.dart';

class HeroImageDetail extends StatelessWidget {
  final String _imageUrl;
  const HeroImageDetail(this._imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(tag: this._imageUrl, child: Image.network(this._imageUrl)),
      )),
    );
  }
}

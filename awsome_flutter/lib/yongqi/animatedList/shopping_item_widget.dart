import 'package:awsome_flutter/yongqi/animatedList/animated_cell_data.dart';
import 'package:flutter/material.dart';

class ShoppingItemWidget extends StatelessWidget {
  final ShoppingItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;
  const ShoppingItemWidget(
      {required this.item,
      required this.animation,
      required this.onClicked,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueAccent),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            leading: CircleAvatar(
                radius: 32, backgroundImage: AssetImage(item.urlImage!)),
            title: Text(
              item.title!,
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
                onPressed: () {
                  this.onClicked();
                },
                icon: Icon(Icons.check_circle,
                    color: Colors.greenAccent, size: 32)),
          ),
        ));
  }
}

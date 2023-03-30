import 'package:awsome_flutter/yongqi/animatedList/shopping_item_widget.dart';
import 'package:flutter/material.dart';

import 'animated_cell_data.dart';

class AnimatedListCellPage extends StatefulWidget {
  const AnimatedListCellPage({super.key});

  @override
  State<AnimatedListCellPage> createState() => _AnimatedListCellPageState();
}

class _AnimatedListCellPageState extends State<AnimatedListCellPage> {
  final _items = List.from(AnimatedCellListData.shoppingList);
  // 创建一个全局变量的key
  // 这个key 是标识每一条的item 让其具有唯一性 从而控制删除那一条
  final globalKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画List"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: AnimatedList(
                  key: globalKey,
                  initialItemCount: _items.length,
                  itemBuilder: (context, index, animation) {
                    return _buildItem(_items[index], index, animation);
                  }),
            )),
            Container(
              padding: EdgeInsets.all(16),
              child: _buildInsertButton(),
            )
          ],
        ));
  }

  // 传递三个参数
  _buildItem(item, int index, Animation<double> animation) {
    return ShoppingItemWidget(
        item: item, animation: animation, onClicked: () => _removeItem(index));
  }

// 删除item 的方法
  _removeItem(index) {
    // 第一次是删除数据
    final item = _items.removeAt(index);
    // 通过key
    globalKey.currentState!.removeItem(
        index, (context, animation) => _buildItem(item, index, animation));
  }

  _buildInsertButton() {
    return ElevatedButton(onPressed: () {}, child: Text("新增商品"));
  }
}

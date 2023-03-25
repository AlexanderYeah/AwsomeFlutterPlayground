import 'package:awsome_flutter/juexin/researchKey/rk_normal_key_cart_model.dart';
import 'package:awsome_flutter/juexin/researchKey/rk_normal_key_widget_a.dart';
import 'package:flutter/material.dart';

class RKNormalKeyPage extends StatefulWidget {
  const RKNormalKeyPage({super.key});

  @override
  State<RKNormalKeyPage> createState() => _RKNormalKeyPageState();
}

// 参考:
// https://blog.csdn.net/u011272795/article/details/120034166?spm=1001.2014.3001.5501
class _RKNormalKeyPageState extends State<RKNormalKeyPage> {
  List _carts = [
    {"name": "橘子", "id": "dasdas52d1351sdada"},
    {"name": "苹果", "id": "dagggd1351sdada"},
    {"name": "香蕉", "id": "dasdasjjj52d1351sdada"},
    {"name": "西瓜", "id": "dasssa52d1351sdada"},
    {"name": "桃子", "id": "dapppas52d1351sdada"}
  ];

  List _modelList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carts.forEach((element) {
      _modelList.add(RKCartItem.fromJson(element));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal Key"),
      ),
      // 在这里 如果不添加value key 的话 明显有一个bug
      // 就比如说这个是一个购物车的列表 一共有5条数据，如果我们修改第四条的数量，然后把第四条删除，
      // 那么第五条的数据的数量就会变成第四条的数量 这样一个bug

      // 这里估计是因为widget 是复用的，而flutter 是分不清哪个是哪个widget了,所以用一个key 来表示,就相当于一个ID
      // 解决这个问题 可以传入一个valueKey 把item本身的索引传递进去 这样就可以避免这个问题
      // 并且这个key 是已经定义好的 直接传递进去就可以
      // 不要使用ValueKey(index), 因为index 会随着数组的变化而变化 使用UniqueKey(), 就可以解决这个问题
      body: ListView.builder(
        itemCount: _modelList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _modelList.removeAt(index);
              });
            },
            child: RKNormalKeyContainerA(_modelList[index].name,
                key: ValueKey(_modelList[index].id)),
          );
        },
      ),
    );
  }
}

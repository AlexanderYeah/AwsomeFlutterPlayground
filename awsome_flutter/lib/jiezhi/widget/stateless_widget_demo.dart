import 'package:flutter/material.dart';

class StateLessDemoPage extends StatelessWidget {
  const StateLessDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无状态组件"),
      ),
      body: ListView(
        children: [
          ProductItem("EXPMA", "EXPMA指标是指数平均数。",
              "https://t7.baidu.com/it/u=4080826490,615918710&fm=193&f=GIF"),
          ProductItem("EXPMA", "EXPMA指标是指数平均数。",
              "https://t7.baidu.com/it/u=4080826490,615918710&fm=193&f=GIF"),
          ProductItem("EXPMA", "EXPMA指标是指数平均数。",
              "https://t7.baidu.com/it/u=4080826490,615918710&fm=193&f=GIF"),
        ],
      ),
    );
  }
}

// 为什么flutter 在设计的时候 StatefulWidget 的 build 方法放在state 中
/**
 *  1 build 出来的widget 是需要依赖state 中的变量的(状态和数据)
 *  2 在flutter 运行过程中，Widget 是不断要销毁和创建的，当我们自己的状态发生改变的时候,并不希望重新创建一个新的state
 * */

class ProductItem extends StatefulWidget {
  final String name;
  final String info;
  final String cover;

  ProductItem(this.name, this.info, this.cover);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductItemState();
  }
}

class _ProductItemState extends State<ProductItem> {
  final titleStyle = TextStyle(color: Colors.black54, fontSize: 30);
  final infoStyle = TextStyle(color: Colors.blueAccent, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.lightBlueAccent)),
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("123")),
          Text(
            widget.name,
            style: titleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.info,
            style: infoStyle,
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              widget.cover,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}

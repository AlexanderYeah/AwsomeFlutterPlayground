import 'package:awsome_flutter/juexin/researchKey/rk_global_key_box.dart';
import 'package:flutter/material.dart';
import '../../util/edit.dart';

class RKGlobalKeyPage extends StatefulWidget {
  const RKGlobalKeyPage({super.key});

  @override
  State<RKGlobalKeyPage> createState() => _RKGlobalKeyPageState();
}

class _RKGlobalKeyPageState extends State<RKGlobalKeyPage> {
  // 使用GlobalKey不应该在每次build的时候重建GlobalKey, 它应该是State拥有的长期存在的对象.
// 所以我们应该先定义一个GlobalKey:
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal Key"),
      ),
      body: ListView(
        children: [
          // 不改变层级的时候 热更新是没问题 但是我们给第二个box 包裹一个center组件，第二个的数量就会丢失
          // 也就是状态搞丢了 那么这个时候就可以通过绑定gloabl Key 去保持状态
          RKGlobalKeyBox(
            Colors.red,
            key: ValueKey(1),
          ),
          // RKGlobalKeyBox(
          //     Colors.blue,
          //     key: ValueKey(2),
          //   ),
          // Center(
          //   child: RKGlobalKeyBox(
          //     Colors.blue,
          //     key: ValueKey(2),
          //   ),
          // )
          // 添加global 状态不会丢失

          Center(
            child: RKGlobalKeyBox(
              Colors.blue,
              key: _globalKey,
            ),
          ),
          Edit.instance().header("一 GlobalKey"),
          Edit.instance().text(
              "使用GlobalKey不应该在每次build的时候重建GlobalKey, 它应该是State拥有的长期存在的对象."),
          Edit.instance().text("我们可以通过GlobalKey来找到对应的widget,甚至是state等更多相关的东西."),
          Edit.instance().text("获取对应的state"),
          Edit.instance().text("获取对应的widget"),
          Edit.instance().text(
              "获取对应的context,通过currentContext,可以获得对应的context,context其实指的就是element,比如我想知道对应组件的尺寸,位置.这其实都是难以获得的信息."),
          Edit.instance().text(
              "final renderBox = _globalKey.currentContext!.findRenderObject() as RenderBox;可以看到renderBox有一个对应的size方法,通过它就可以拿到对应widget的尺寸")
        ],
      ),
    );
  }
}

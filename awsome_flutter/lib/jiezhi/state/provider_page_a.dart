import 'package:awsome_flutter/jiezhi/state/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_page_son_widget.dart';

class ProviderPageA extends StatefulWidget {
  const ProviderPageA({super.key});

  @override
  State<ProviderPageA> createState() => _ProviderPageAState();
}

class _ProviderPageAState extends State<ProviderPageA> {
  var _countProvider;
  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("使用Provider 共享数据"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "一 如何使用",
            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
          ),
          Text(
              "Provider放置的位置一般是在相应的widget的外层，也就是数据状态的共享都是在该层的widget内部进行,使用MutiProvider来完成多个多个provider的设置"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // 点击按钮自增1
                this._countProvider.increment();
              },
              child: Text(
                "+1操作",
                textAlign: TextAlign.center,
              )),
          ElevatedButton(
              onPressed: () {
                // 点击按钮自增1
                this._countProvider.reset();
              },
              child: Text(
                "重置",
                textAlign: TextAlign.center,
              )),
          // 子组件显示结果
          ProviderSonWidget()
        ],
      ),
    );
  }
}

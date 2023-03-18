import 'package:awsome_flutter/widget/tips_dailog.dart';
import 'package:flutter/material.dart';
import '../../widget/jz_list_item.dart';
import '../../jiezhi/localData/jz_local_data.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});
  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地存储"),
      ),
      body: ListView.builder(
        itemCount: jz_storage_data.length,
        itemBuilder: (BuildContext context, int index) {
          return JZListItem(
            index,
            jz_storage_data[index]["title"],
            jz_storage_data[index]["content"],
            (idx) {
              print(idx);
              if (idx == 0) {
                Navigator.of(context).pushNamed("/sto_share_preference");
              }
            },
            tipsClick: (idx) {
              TipsDialog(jz_storage_data[index]["title"],
                      jz_storage_data[index]["tips"], context)
                  .openAlertDialog();
            },
          );
        },
      ),
    );
  }
}

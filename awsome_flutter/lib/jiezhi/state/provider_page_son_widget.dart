import 'package:awsome_flutter/jiezhi/state/count_provider.dart';
import 'package:awsome_flutter/jiezhi/state/userinfo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_page_son_widget.dart';

class ProviderSonWidget extends StatefulWidget {
  const ProviderSonWidget({super.key});
  @override
  State<ProviderSonWidget> createState() => _ProviderSonWidgetState();
}

class _ProviderSonWidgetState extends State<ProviderSonWidget> {
  // var _countProvider;
  @override
  Widget build(BuildContext context) {
    print("计数改变了,ProviderSonWidgetState 调用了build");
    // _countProvider = Provider.of<CountProvider>(context);

    return Consumer2<CountProvider, UserInfoProvider>(
      builder: (context, cntProvider, userProvider, child) {
        return Container(
          child: Text("${cntProvider.count}---${userProvider.getUsername()}"),
        );
      },
    );
  }
}

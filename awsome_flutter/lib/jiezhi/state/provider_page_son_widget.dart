import 'package:awsome_flutter/jiezhi/state/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_page_son_widget.dart';

class ProviderSonWidget extends StatefulWidget {
  const ProviderSonWidget({super.key});

  @override
  State<ProviderSonWidget> createState() => _ProviderSonWidgetState();
}

class _ProviderSonWidgetState extends State<ProviderSonWidget> {
  var _countProvider;
  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context);
    return Container(
      child: Text("${this._countProvider.count}"),
    );
  }
}

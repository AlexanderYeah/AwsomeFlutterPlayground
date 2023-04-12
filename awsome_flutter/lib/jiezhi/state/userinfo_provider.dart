import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoProvider with ChangeNotifier {
  String _username = "leonardo";
  String getUsername() => _username;
  set(name) {
    _username = name;
    notifyListeners();
  }
}

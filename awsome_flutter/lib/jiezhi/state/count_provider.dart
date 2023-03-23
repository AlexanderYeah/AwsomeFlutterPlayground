import 'package:flutter/foundation.dart';

// 第一步实现基于ChangeNotifier的类 内部维护一个计数
// 当计数有变化的时候，同时感知所有的监听者
class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    // 这里一定要通知变化
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

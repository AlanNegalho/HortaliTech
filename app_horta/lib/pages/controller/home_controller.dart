import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  int _currentIndex = 0;
  double value = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setValue(double x) {
    value = x;
    notifyListeners();
  }
}

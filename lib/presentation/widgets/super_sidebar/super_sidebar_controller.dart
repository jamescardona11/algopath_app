import 'dart:async';

import 'package:flutter/material.dart';

class SuperSidebarController extends ChangeNotifier {
  SuperSidebarController({
    required int selectedIndex,
    bool extended = true,
  }) : _selectedIndex = selectedIndex {
    _setExtended(extended);
  }

  int _selectedIndex;
  var _extended = false;

  final _extendedController = StreamController<bool>.broadcast();
  Stream<bool> get extendStream => _extendedController.stream.asBroadcastStream();

  int get selectedIndex => _selectedIndex;
  void selectIndex(int val) {
    if (val == _selectedIndex) return;
    _selectedIndex = val;
    notifyListeners();
  }

  bool get extended => _extended;
  bool get collapse => !_extended;
  void setExtended(bool extended) {
    if (extended == _extended) return;
    _extended = extended;
    _extendedController.add(extended);
    notifyListeners();
  }

  void toggleExtended() {
    _extended = !_extended;
    _extendedController.add(_extended);
    notifyListeners();
  }

  void _setExtended(bool val) {
    _extended = val;
    notifyListeners();
  }

  @override
  void dispose() {
    _extendedController.close();
    super.dispose();
  }
}

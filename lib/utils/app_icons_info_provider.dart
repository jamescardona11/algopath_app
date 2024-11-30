import 'dart:math';

import 'package:algopath_app/config/res/res.dart';
import 'package:algopath_app/domain/icon_info/app_icon_info.dart';
import 'package:collection/collection.dart';

class AppIconsInfoProvider {
  final Map<int, AppIconInfo> _icons = {};

  AppIconsInfoProvider._() {
    _fillIcons();
  }

  static AppIconsInfoProvider? _instance;

  factory AppIconsInfoProvider() {
    _instance ??= AppIconsInfoProvider._();
    return _instance!;
  }

  int get length => _icons.length;

  Map<int, AppIconInfo> get icons => _icons;

  AppIconInfo operator [](int index) => _icons[index]!;

  int get randomIconId => Random().nextInt(_icons.length - 1);

  void _fillIcons() {
    _icons.addAll(
      Map.fromEntries(
        AppIcons.icons.mapIndexed(
          (index, element) => MapEntry(
            index,
            AppIconInfo(
              id: index,
              name: element.$1,
              icon: element.$2,
            ),
          ),
        ),
      ),
    );
  }
}

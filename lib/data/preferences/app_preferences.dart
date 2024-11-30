import 'dart:async';

import 'package:algopath_app/domain/result/app_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  factory AppPreferences() {
    _instance ??= AppPreferences._();
    return _instance!;
  }

  Future<SharedPreferences> get _sp => SharedPreferences.getInstance();

  Future<bool> save<D>(String key, D value) async {
    final sp = await _sp;
    if (value is bool) {
      return sp.setBool(key, value);
    } else if (value is int) {
      return sp.setInt(key, value);
    } else if (value is double) {
      return sp.setDouble(key, value);
    } else if (value is String) {
      return sp.setString(key, value);
    } else {
      throw const UpsertError();
    }
  }

  Future<bool?> readBool(String key) => _sp.then((sp) => sp.getBool(key));

  Future<int?> readInt(String key) => _sp.then((sp) => sp.getInt(key));

  Future<double?> readDouble(String key) => _sp.then((sp) => sp.getDouble(key));

  Future<String?> readString(String key) => _sp.then((sp) => sp.getString(key));

  Future<void> delete(String key) => _sp.then((sp) => sp.remove(key));

  Future<bool> has(String key) => _sp.then((sp) => sp.containsKey(key));

  Future<void> clean() => _sp.then((sp) => sp.clear());
}

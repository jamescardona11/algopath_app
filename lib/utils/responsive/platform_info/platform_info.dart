// ignore_for_file: constant_identifier_names

import 'platform_web.dart' if (dart.library.io) 'platform_mobile.dart';

abstract class PlatformInfo {
  static PlatformInfoType get value => currentPlatformInfo;

  static bool get isWeb => currentPlatformInfo == PlatformInfoType.Web;
  static bool get isMacOS => currentPlatformInfo == PlatformInfoType.MacOS;
  static bool get isWindows => currentPlatformInfo == PlatformInfoType.Windows;
  static bool get isLinux => currentPlatformInfo == PlatformInfoType.Linux;
  static bool get isAndroid => currentPlatformInfo == PlatformInfoType.Android;
  static bool get isIOS => currentPlatformInfo == PlatformInfoType.IOS;
  static bool get isMobile => isAndroid || isIOS;
}

enum PlatformInfoType {
  Web,
  Windows,
  Linux,
  MacOS,
  Android,
  IOS,
}

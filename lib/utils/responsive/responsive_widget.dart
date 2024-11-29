import 'package:flutter/material.dart';
import 'device_screen_type.dart';

/// A widget that builds itself based on the current device's screen type.
/// 
/// This widget uses a [LayoutBuilder] to determine the current screen dimensions
/// and provides a [DeviceScreenType] to its builder function, allowing for
/// responsive layouts.
/// 
/// Example usage:
/// ```dart
/// ResponsiveWidget(
///   builder: (context, screenType) {
///     switch (screenType) {
///       case DeviceScreenType.mobile:
///         return MobileLayout();
///       case DeviceScreenType.tablet:
///         return TabletLayout();
///       case DeviceScreenType.desktop:
///         return DesktopLayout();
///     }
///   },
/// )
/// ```
class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceScreenType screenType) builder;

  const ResponsiveWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;
        final deviceScreenType = getDeviceScreenType(height, width);
        return builder(context, deviceScreenType);
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppDialog {
  double? _width;
  double? _height;
  Widget? _child;
  bool? _barrierDismissible;
  Color? _barrierColor;
  Color? _backgroundColor;
  BorderRadiusGeometry? _borderRadius;
  bool? _addShadow;
  AsyncValueSetter<dynamic>? _onResult;

  AppDialog.def({
    double? width,
    double? height,
    Widget? child,
    bool? barrierDismissible,
    Color? barrierColor,
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    bool? addShadow,
    AsyncValueSetter<dynamic>? onResult,
  }) {
    _barrierDismissible = barrierDismissible;
    _barrierColor = barrierColor;
    _backgroundColor = backgroundColor;
    _borderRadius = borderRadius;
    _addShadow = addShadow;
    _onResult = onResult;
    _width = width;
    _height = height;
    _child = child;
  }

  AppDialog size({double? width, double? height}) {
    _width = width;
    _height = height;
    return this;
  }

  AppDialog child(Widget child) {
    _child = child;
    return this;
  }

  AppDialog barrierDismissible(bool value) {
    _barrierDismissible = value;
    return this;
  }

  AppDialog barrierColor(Color value) {
    _barrierColor = value;
    return this;
  }

  AppDialog backgroundColor(Color value) {
    _backgroundColor = value;
    return this;
  }

  AppDialog borderRadius(BorderRadiusGeometry value) {
    _borderRadius = value;
    return this;
  }

  AppDialog addShadow(bool value) {
    _addShadow = value;
    return this;
  }

  AppDialog onResult(AsyncValueSetter<dynamic> value) {
    _onResult = value;
    return this;
  }

  Future<dynamic> show(BuildContext context) async {
    assert(_child != null, 'Please provide a child widget');

    return showDialog(
      context: context,
      barrierDismissible: _barrierDismissible ?? true,
      barrierColor: _barrierColor ?? Colors.black26,
      builder: (context) => Dialog(
        child: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius ?? BorderRadius.circular(12),
            color: _backgroundColor ?? Colors.white,
            boxShadow: _shadows,
          ),
          child: _child!,
        ),
      ),
    ).then((value) {
      if (_onResult != null) {
        _onResult!(value);
      }

      return value;
    });
  }

  List<BoxShadow>? get _shadows {
    return (_addShadow ?? false)
        ? const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(6, 6),
              spreadRadius: 1,
              blurStyle: BlurStyle.solid,
            ),
          ]
        : null;
  }
}

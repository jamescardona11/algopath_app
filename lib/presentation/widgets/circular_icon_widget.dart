import 'package:algopath_app/config/theme/theme.dart';
import 'package:algopath_app/utils/flutter_book.dart';
import 'package:flutter/material.dart';

import 'bounce_wrapper.dart';
import 'hover_wrapper.dart';

@FlutterBook.uiWidget()
class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    super.key,
    this.onPressed,
    required this.icon,
    this.iconColor = AppColors.grey,
    this.backgroundColor = AppColors.grey100,
    this.iconSize = 16,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final buttonSize = iconSize + 16;
    return BounceWrapper(
      onPressed: onPressed,
      child: HoverWrapper(
        shape: BoxShape.circle,
        backgroundColor: backgroundColor,
        child: SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}

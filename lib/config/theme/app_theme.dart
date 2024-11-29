// fonts: https://www.youtube.com/watch?v=iJ0LT1vkh6M
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme() {
    final textTheme = AppTextTheme();

    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      textTheme: textTheme,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
          elevation: 0,
          textStyle: textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: const IconThemeData(color: AppColors.textColor),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.secondaryTextColor,
        brightness: Brightness.light,
        disabledColor: AppColors.grey,
        labelStyle: textTheme.bodyMedium,
        padding: const EdgeInsets.all(8),
        secondaryLabelStyle: textTheme.bodySmall!.copyWith(color: Colors.white),
        secondarySelectedColor: AppColors.secondaryTextColor,
        selectedColor: AppColors.primary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      // elevatedButtonTheme:
    );
  }

  static OutlineInputBorder get _defaultOutlineInputBorder => const OutlineInputBorder(borderSide: BorderSide.none);
}

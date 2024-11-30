import 'package:flutter/material.dart';

class AppIconInfo {
  final int id;
  final String name;
  final IconData icon;
  final Color? color;

  const AppIconInfo({
    required this.id,
    required this.name,
    required this.icon,
    this.color,
  });
}

import 'package:flutter/material.dart';

class SuperSidebarItem {
  const SuperSidebarItem({
    required this.icon,
    this.label,
    this.onTap,
    this.onIconTap,
    this.selectable = true,
    this.shoOnlyInCollapsed = false,
  });

  final String? label;
  final IconData icon;
  final bool selectable;
  final bool shoOnlyInCollapsed;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;
}

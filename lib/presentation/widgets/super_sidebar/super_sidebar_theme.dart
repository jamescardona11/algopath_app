import 'package:flutter/material.dart';

class SuperSidebarTheme {
  final SidebarType type;
  final double collapsedSize;
  final double expandedSize;
  final double headerHeight;
  final double itemHeight;
  final Color backgroundColor;
  final EdgeInsets pinnedMargin;
  final BorderRadius collapsedBorderRadius;
  final SidebarControlIconTheme controlIconTheme;

  final SidebarIconTheme iconTheme;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final TextStyle hoveredTextStyle;
  final Color? backgroundSelectedItemColor;
  final Color? hoveredItemColor;
  final Color? selectedIndicatorColor;

  const SuperSidebarTheme._({
    this.type = SidebarType.pinned,
    this.collapsedSize = 70,
    this.expandedSize = 230,
    this.headerHeight = 60,
    this.itemHeight = 40,
    this.backgroundColor = Colors.white,
    this.pinnedMargin = const EdgeInsets.all(8),
    this.collapsedBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.controlIconTheme = const SidebarControlIconTheme(),
    this.iconTheme = const SidebarIconTheme(),
    this.textStyle = _baseTextStyle,
    this.selectedTextStyle = _selectedTextStyle,
    this.hoveredTextStyle = _hoveredTextStyle,
    this.backgroundSelectedItemColor = const Color(0xFFE9E9F0),
    this.hoveredItemColor = const Color(0xFFEEEEF4),
    this.selectedIndicatorColor = Colors.red,
  });

  const SuperSidebarTheme.pinned({
    this.collapsedSize = 70,
    this.expandedSize = 230,
    this.headerHeight = 60,
    this.itemHeight = 40,
    this.backgroundColor = Colors.white,
    this.pinnedMargin = const EdgeInsets.all(8),
    this.collapsedBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.controlIconTheme = const SidebarControlIconTheme(),
    this.iconTheme = const SidebarIconTheme(),
    this.textStyle = _baseTextStyle,
    this.selectedTextStyle = _selectedTextStyle,
    this.hoveredTextStyle = _hoveredTextStyle,
    this.backgroundSelectedItemColor = const Color(0xFFE9E9F0),
    this.hoveredItemColor = const Color(0xFFEEEEF4),
    this.selectedIndicatorColor = Colors.red,
  }) : type = SidebarType.pinned;

  const SuperSidebarTheme.floating({
    double size = 230,
    this.headerHeight = 60,
    this.itemHeight = 40,
    this.backgroundColor = Colors.white,
    this.collapsedBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.controlIconTheme = const SidebarControlIconTheme(),
    this.iconTheme = const SidebarIconTheme(),
    this.textStyle = _baseTextStyle,
    this.selectedTextStyle = _selectedTextStyle,
    this.hoveredTextStyle = _hoveredTextStyle,
    this.backgroundSelectedItemColor = const Color(0xFFE9E9F0),
    this.hoveredItemColor = const Color(0xFFEEEEF4),
    this.selectedIndicatorColor = Colors.red,
  })  : type = SidebarType.floating,
        pinnedMargin = const EdgeInsets.all(8),
        collapsedSize = size,
        expandedSize = size;

  static const minExpandedSizeToShowLargeElements = 140;

  bool get showLargeElements => expandedSize > minExpandedSizeToShowLargeElements;

  bool get hideLargeElements => expandedSize < minExpandedSizeToShowLargeElements;

  bool get showMenuIcon => controlIconTheme.showMenuIcon;

  IconData menuIcon(bool extended) => controlIconTheme.menuIcon(extended);

  bool get showBottomCloseIcon => controlIconTheme.showBottomCloseIcon;

  IconData bottomCloseIcon(bool extended) => controlIconTheme.bottomCloseIcon(extended);

  static const _baseTextStyle = TextStyle(
    color: Colors.black54,
  );

  static const _selectedTextStyle = TextStyle(
    color: Colors.black,
  );

  static const _hoveredTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  SuperSidebarTheme copyWith({
    SidebarType? type,
    double? expandedSize,
    double? collapsedSize,
  }) {
    return SuperSidebarTheme._(
      type: type ?? this.type,
      expandedSize: expandedSize ?? this.expandedSize,
      collapsedSize: collapsedSize ?? this.collapsedSize,
      headerHeight: headerHeight,
      backgroundColor: backgroundColor,
      pinnedMargin: pinnedMargin,
      collapsedBorderRadius: collapsedBorderRadius,
      controlIconTheme: controlIconTheme,
      iconTheme: iconTheme,
      textStyle: textStyle,
      selectedTextStyle: selectedTextStyle,
      hoveredTextStyle: hoveredTextStyle,
      backgroundSelectedItemColor: backgroundSelectedItemColor,
      hoveredItemColor: hoveredItemColor,
      selectedIndicatorColor: selectedIndicatorColor,
    );
  }
}

class SidebarControlIconTheme {
  final bool showMenuIcon;
  final IconData extendedMenuIcon;
  final IconData? collapsedMenuIcon;
  final bool showBottomCloseIcon;
  final IconData extendedBottomCloseIcon;
  final IconData collapsedBottomCloseIcon;

  const SidebarControlIconTheme({
    this.showMenuIcon = true,
    this.extendedMenuIcon = Icons.menu,
    this.collapsedMenuIcon,
    this.showBottomCloseIcon = true,
    this.extendedBottomCloseIcon = Icons.arrow_back_ios_new,
    this.collapsedBottomCloseIcon = Icons.arrow_forward_ios,
  });

  IconData menuIcon(bool extended) => extended ? extendedMenuIcon : collapsedMenuIcon ?? extendedMenuIcon;

  IconData bottomCloseIcon(bool extended) => extended ? extendedBottomCloseIcon : collapsedBottomCloseIcon;
}

class SidebarIconTheme {
  final Color color;
  final Color? selectedColor;
  final double size;

  const SidebarIconTheme({
    this.color = Colors.grey,
    this.selectedColor,
    this.size = 16,
  });
}

enum SidebarType {
  pinned,
  floating;

  bool get isFloating => this == floating;
  bool get isPinned => this == pinned;
}

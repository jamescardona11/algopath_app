import 'package:algopath_app/presentation/widgets/bounce_wrapper.dart';
import 'package:flutter/material.dart';

import 'super_sidebar_item.dart';
import 'super_sidebar_theme.dart';

class SuperSidebarItemTile extends StatefulWidget {
  const SuperSidebarItemTile({
    super.key,
    required this.item,
    required this.extended,
    required this.selected,
    required this.onTap,
    required this.animationController,
    required this.theme,
  });

  final SuperSidebarItem item;
  final bool extended;
  final bool selected;
  final VoidCallback onTap;
  final AnimationController animationController;
  final SuperSidebarTheme theme;

  @override
  State<SuperSidebarItemTile> createState() => _SuperSidebarItemTileState();
}

class _SuperSidebarItemTileState extends State<SuperSidebarItemTile> with SingleTickerProviderStateMixin {
  late final AnimationController _iconController;
  late SuperSidebarTheme theme;

  var _hovered = false;

  @override
  void initState() {
    super.initState();
    theme = widget.theme;

    _iconController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: MouseRegion(
        onEnter: (_) => _onEnteredItemZone(),
        onExit: (_) => _onExitItemZone(),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          onTapUp: (_) => _iconController.forward().then((value) => _iconController.reverse()),
          behavior: HitTestBehavior.opaque,
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (_, child) {
              return ClipRRect(
                borderRadius: borderRadius,
                child: Container(
                  height: theme.itemHeight,
                  padding: EdgeInsets.only(left: leftPadding),
                  decoration: BoxDecoration(
                    color: colorDecoration,
                    border: border,
                  ),
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      _SidebarXIcon(
                        icon: widget.item.icon,
                        iconTheme: theme.iconTheme,
                        selected: widget.selected,
                        onTap: widget.onTap,
                        onIconTap: widget.extended ? widget.item.onIconTap : null,
                        hovered: _hovered,
                        controller: _iconController,
                      ),
                      if (widget.animationController.value < 0.4 && theme.type.isPinned)
                        const SizedBox()
                      else if (widget.item.label != null && theme.showLargeElements)
                        Flexible(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              widget.item.label ?? '',
                              style: textStyle,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Color? get colorDecoration {
    if (widget.selected) {
      return theme.backgroundSelectedItemColor;
    } else if (_hovered) {
      return theme.hoveredItemColor;
    }

    return null;
  }

  BoxBorder? get border {
    return widget.selected && (widget.extended || theme.type.isFloating) && theme.selectedIndicatorColor != null
        ? Border(
            right: BorderSide(
              color: theme.selectedIndicatorColor!,
              width: 2,
            ),
          )
        : null;
  }

  double get horizontalPadding {
    if (theme.type.isFloating && theme.showLargeElements) {
      return 0;
    } else if (theme.type.isFloating && theme.hideLargeElements) {
      return 4;
    }

    return widget.extended ? 0 : 4;
  }

  double get leftPadding {
    const p = 16.0;
    if (theme.type.isFloating && theme.showLargeElements) {
      return p;
    } else if (theme.type.isFloating && theme.hideLargeElements) {
      return 0;
    }

    return widget.animationController.value * p;
  }

  BorderRadiusGeometry get borderRadius {
    if (theme.type.isFloating && theme.showLargeElements) {
      return BorderRadius.zero;
    } else if (theme.type.isFloating && theme.hideLargeElements) {
      return BorderRadius.circular(8);
    }

    return widget.animationController.value < 0.4 ? BorderRadius.circular(8) : BorderRadius.zero;
  }

  MainAxisAlignment get mainAxisAlignment {
    if (theme.type.isFloating && theme.showLargeElements) {
      return MainAxisAlignment.start;
    } else if (theme.type.isFloating && theme.hideLargeElements) {
      return MainAxisAlignment.center;
    }

    return widget.animationController.value > 0.4 ? MainAxisAlignment.start : MainAxisAlignment.center;
  }

  TextStyle get textStyle {
    if (widget.selected) {
      return theme.selectedTextStyle;
    }

    if (_hovered) {
      return theme.hoveredTextStyle;
    }

    return theme.textStyle;
  }

  void _onEnteredItemZone() {
    setState(() => _hovered = true);
  }

  void _onExitItemZone() {
    setState(() => _hovered = false);
  }
}

class _SidebarXIcon extends StatelessWidget {
  const _SidebarXIcon({
    required this.icon,
    required this.selected,
    required this.hovered,
    required this.onTap,
    required this.onIconTap,
    required this.controller,
    required this.iconTheme,
  });

  final IconData icon;
  final bool selected;
  final bool hovered;
  final VoidCallback? onTap;
  final VoidCallback? onIconTap;
  final SidebarIconTheme iconTheme;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final iconColor = selected ? iconTheme.selectedColor : iconTheme.color;

    return IgnorePointer(
      ignoring: onIconTap == null,
      child: BounceWrapper(
        controller: controller,
        reverse: false,
        onPressed: () {
          onTap?.call();
          onIconTap?.call();
        },
        child: Icon(
          icon,
          color: iconColor ?? iconTheme.color,
          size: iconTheme.size,
        ),
      ),
    );
  }
}

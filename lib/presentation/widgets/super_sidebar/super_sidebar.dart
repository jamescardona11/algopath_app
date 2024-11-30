import 'package:algopath_app/presentation/widgets/circular_icon_widget.dart';
import 'package:flutter/material.dart';

import 'super_sidebar_controller.dart';
import 'super_sidebar_item.dart';
import 'super_sidebar_item_tile.dart';
import 'super_sidebar_theme.dart';

class SuperSidebar extends StatefulWidget {
  const SuperSidebar({
    super.key,
    required this.child,
    this.controller,
    this.items = const [],
    this.headerItems = const [],
    this.sidebarTheme = const SuperSidebarTheme.pinned(),
    this.index = 0,
    this.onItemSelected,
  });

  final List<SuperSidebarItem> items;
  final List<SuperSidebarItem> headerItems;
  final SuperSidebarTheme sidebarTheme;
  final SuperSidebarController? controller;
  final Widget child;
  final int index;
  final ValueChanged<int>? onItemSelected;

  @override
  State<SuperSidebar> createState() => _SuperSidebarState();
}

class _SuperSidebarState extends State<SuperSidebar> with TickerProviderStateMixin {
  late final SuperSidebarController _controller;
  late final AnimationController _extendAnimationController;
  late final AnimationController _hoverAnimationController;

  late SuperSidebarTheme _theme;

  final duration = const Duration(milliseconds: 100);

  @override
  void initState() {
    _theme = widget.sidebarTheme;

    initAnimationsControllers();
    initListener();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SuperSidebar oldWidget) {
    if (oldWidget.sidebarTheme != widget.sidebarTheme) {
      _theme = widget.sidebarTheme;
    }

    if (oldWidget.index != widget.index) {
      _controller.selectIndex(widget.index);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AnimatedBuilder(
      animation: Listenable.merge([
        _controller,
        _extendAnimationController,
        _hoverAnimationController,
      ]),
      builder: (_, child) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: positionLeftBodyWidget,
                child: widget.child,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: MouseRegion(
                  onEnter: (_) => _onEnteredLineZone(),
                  child: Container(
                    width: 10,
                    height: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: duration,
                left: positionLeftSidebar,
                top: 0,
                bottom: 0,
                child: MouseRegion(
                  onExit: (_) => _onExitSidebar(),
                  child: AnimatedContainer(
                    duration: duration,
                    width: _controller.extended ? _theme.expandedSize : _theme.collapsedSize,
                    height: double.infinity,
                    padding: EdgeInsets.zero,
                    margin: _controller.extended ? const EdgeInsets.all(0) : _theme.pinnedMargin,
                    decoration: BoxDecoration(
                      borderRadius: _controller.extended ? BorderRadius.zero : _theme.collapsedBorderRadius,
                      color: _theme.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header
                        SizedBox(
                          height: _theme.headerHeight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
                            child: Row(
                              mainAxisAlignment: mainAxisAlignment,
                              children: [
                                if (_theme.showMenuIcon)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: CircularIconWidget(
                                      onPressed: _onToggleExtended,
                                      icon: _theme.menuIcon(_controller.extended),
                                    ),
                                  ),
                                if (showHeaderItems) ...[
                                  for (var item in widget.headerItems)
                                    CircularIconWidget(
                                      onPressed: item.onTap,
                                      icon: item.icon,
                                    ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.items.length,
                            itemBuilder: (_, index) {
                              final item = widget.items[index];
                              if (item.shoOnlyInCollapsed && _controller.extended) return const SizedBox();

                              return SuperSidebarItemTile(
                                item: item,
                                theme: _theme,
                                animationController: _extendAnimationController,
                                extended: _controller.extended,
                                selected: _controller.selectedIndex == index,
                                onTap: () => _onItemSelected(item, index),
                              );
                            },
                          ),
                        ),
                        if (_theme.showBottomCloseIcon)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
                            child: Row(
                              mainAxisAlignment: mainAxisAlignment,
                              children: [
                                CircularIconWidget(
                                  onPressed: _onToggleExtended,
                                  icon: _theme.bottomCloseIcon(_controller.extended),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void initAnimationsControllers() {
    _extendAnimationController = AnimationController(
      vsync: this,
      duration: duration,
    );

    _hoverAnimationController = AnimationController(
      vsync: this,
      duration: duration,
    );

    _controller = widget.controller ?? SuperSidebarController(selectedIndex: widget.index, extended: true);
    initControllerValues();
  }

  void initControllerValues() {
    if (_controller.extended) {
      _extendAnimationController.value = 1;
      _hoverAnimationController.value = 0;
    } else {
      _extendAnimationController.value = 0;
      _hoverAnimationController.value = 1;
    }

    _controller.selectIndex(widget.index);
  }

  void initListener() {
    _controller.extendStream.listen(
      (extended) {
        if (_extendAnimationController.isCompleted) {
          if (mounted) _extendAnimationController.reverse();
        } else {
          _extendAnimationController.forward();
        }
      },
    );
  }

  double get positionLeftSidebar {
    if (_theme.type.isFloating) {
      return _controller.extended
          ? (_extendAnimationController.value - 1) * (_theme.expandedSize)
          : (_hoverAnimationController.value - 1) * (_theme.expandedSize + 20);
    }

    return 0;
  }

  double get positionLeftBodyWidget {
    if (_theme.type.isFloating) {
      return _theme.expandedSize * _extendAnimationController.value;
    }

    return _controller.extended ? _theme.expandedSize * _extendAnimationController.value : _theme.collapsedSize + _theme.pinnedMargin.right;
  }

  bool get showHeaderItems {
    if (widget.headerItems.isEmpty) return false;

    if (_theme.type.isFloating && _theme.showLargeElements) {
      return true;
    } else if (_theme.type.isFloating && _theme.hideLargeElements) {
      return false;
    }

    return _extendAnimationController.value > 0.8;
  }

  MainAxisAlignment get mainAxisAlignment {
    if (_theme.type.isFloating && _theme.showLargeElements) {
      return MainAxisAlignment.end;
    } else if (_theme.type.isFloating && _theme.hideLargeElements) {
      return MainAxisAlignment.center;
    }

    return _controller.extended ? MainAxisAlignment.end : MainAxisAlignment.center;
  }

  void _onEnteredLineZone() {
    if (_theme.type.isFloating) {
      _hoverAnimationController.forward();
    }
  }

  void _onExitSidebar() {
    if (_theme.type.isFloating && mounted) {
      _hoverAnimationController.reverse();
    }
  }

  void _onToggleExtended() {
    if (_extendAnimationController.isAnimating) return;
    _controller.toggleExtended();
  }

  void _onItemSelected(SuperSidebarItem item, int index) {
    item.onTap?.call();
    widget.onItemSelected?.call(index);
    if (item.selectable) {
      _controller.selectIndex(index);
    }
  }

  @override
  void dispose() {
    _extendAnimationController.dispose();
    super.dispose();
  }
}

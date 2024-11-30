import 'package:algopath_app/utils/flutter_book.dart';
import 'package:algopath_app/utils/responsive/platform_info/platform_info.dart';
import 'package:flutter/material.dart';

@FlutterBook.uiCore()
class HoverWrapper extends StatefulWidget {
  const HoverWrapper({
    super.key,
    required this.child,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.backgroundColor,
    this.fill = false,
    this.fillOnMobile = true,
  });

  final Widget child;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool fillOnMobile;
  final bool fill;

  @override
  State<HoverWrapper> createState() => _HoverWrapperState();
}

class _HoverWrapperState extends State<HoverWrapper> {
  Color? color = Colors.transparent;
  Color? backgroundColor;

  @override
  void initState() {
    backgroundColor = widget.backgroundColor ?? Colors.black.withOpacity(0.1);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HoverWrapper oldWidget) {
    if (oldWidget.backgroundColor != widget.backgroundColor || oldWidget.fill != widget.fill) {
      backgroundColor = widget.backgroundColor ?? Colors.black.withOpacity(0.1);
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = PlatformInfo.isMobile;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.fill || isMobile && widget.fillOnMobile ? backgroundColor : color,
        shape: widget.shape,
        borderRadius: widget.borderRadius,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _hover(true),
        onExit: (_) => _hover(false),
        child: widget.child,
      ),
    );
  }

  void _hover(bool isHovered) {
    if (isHovered) {
      color = backgroundColor;
    } else {
      color = Colors.transparent;
    }

    setState(() {});
  }
}

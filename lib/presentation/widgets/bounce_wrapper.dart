import 'package:algopath_app/utils/flutter_book.dart';
import 'package:flutter/material.dart';

@FlutterBook.uiCore()
class BounceWrapper extends StatefulWidget {
  const BounceWrapper({
    super.key,
    required this.child,
    this.scale = 0.2,
    this.reverse = true,
    this.onPressed,
    this.controller,
  });

  final Widget child;
  final double scale;
  final bool reverse;
  final VoidCallback? onPressed;
  final AnimationController? controller;

  @override
  BounceWrapperState createState() => BounceWrapperState();
}

class BounceWrapperState extends State<BounceWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    final reverseValue = widget.reverse ? -1 : 1;
    final scale = 1 + (widget.scale * reverseValue);

    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 100),
        );

    _scaleAnimation = Tween<double>(begin: 1, end: scale).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapUp: (_) {
        if (widget.controller != null) return;
        _controller.forward().then((value) => _controller.reverse());
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

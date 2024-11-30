import 'package:flutter/material.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({
    super.key,
    this.minimumSize = 38,
    this.borderRadius = 10,
    this.onChangeSearchKey,
    this.backgroundColor,
    this.searchIcon = Icons.search,
    this.searchIconColor = Colors.black,
    this.cleanIcon = Icons.close,
    this.backgroundCleanIcon,
    this.cleanIconColor = Colors.black54,
    this.showCleanIcon = true,
    this.textController,
    this.focusNode,
    this.cursorColor = Colors.black54,
    this.baseTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.hintTextStyle = const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  });

  final TextEditingController? textController;
  final FocusNode? focusNode;
  final double minimumSize;
  final double borderRadius;
  final Function(String)? onChangeSearchKey;
  final Color? backgroundColor;
  final IconData searchIcon;
  final Color searchIconColor;
  final IconData cleanIcon;
  final Color? backgroundCleanIcon;
  final Color cleanIconColor;
  final bool showCleanIcon;
  final Color cursorColor;
  final TextStyle baseTextStyle;
  final TextStyle hintTextStyle;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  String searchValue = '';
  bool firstBuild = true;

  @override
  void initState() {
    _textController = widget.textController ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.minimumSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.showCleanIcon && searchValue.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _textController.clear();
                    widget.onChangeSearchKey?.call('');
                    setState(() {
                      searchValue = '';
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: widget.backgroundCleanIcon ?? Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.cleanIcon,
                      size: 16,
                      color: widget.cleanIconColor,
                    ),
                  ),
                ),
              ),
            Positioned(
              left: 32,
              right: widget.minimumSize,
              top: 2,
              child: Container(
                width: 6,
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: _textController,
                  maxLines: 1,
                  style: widget.baseTextStyle,
                  cursorColor: widget.cursorColor,
                  cursorHeight: 16,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: widget.hintTextStyle,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                  ),
                  onSubmitted: (value) {
                    unfocusKeyboard();
                  },
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                    });
                    widget.onChangeSearchKey?.call(value);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: Icon(
                  widget.searchIcon,
                  size: 20,
                  color: searchValue.isNotEmpty ? widget.searchIconColor : widget.searchIconColor.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void focusListener() {
    Future.delayed(const Duration(milliseconds: 150), () => _focusNode.requestFocus());
  }

  unfocusKeyboard() {
    if (mounted) {
      final FocusScopeNode currentScope = FocusScope.of(context);
      if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }
}

import 'dart:async';

import 'package:algopath_app/config/theme/theme.dart';
import 'package:algopath_app/presentation/widgets/hover_wrapper.dart';
import 'package:algopath_app/utils/app_icons_info_provider.dart';
import 'package:algopath_app/utils/search_regex.dart';
import 'package:flutter/material.dart';

import 'custom_search_widget.dart';

class IconSelectorDialog extends StatefulWidget {
  const IconSelectorDialog({
    super.key,
  });

  @override
  State<IconSelectorDialog> createState() => _IconSelectorDialogState();
}

class _IconSelectorDialogState extends State<IconSelectorDialog> {
  final _searchKeyController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CustomSearchWidget(
            backgroundColor: AppColors.grey50,
            backgroundCleanIcon: AppColors.white,
            onChangeSearchKey: (value) {
              _searchKeyController.add(value);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _GridViewIcons(
              searchKeyStream: _searchKeyController.stream,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridViewIcons extends StatelessWidget {
  const _GridViewIcons({
    required this.searchKeyStream,
  });

  final Stream<String> searchKeyStream;

  @override
  Widget build(BuildContext context) {
    final icons = AppIconsInfoProvider().icons;
    return StreamBuilder<String>(
      stream: searchKeyStream,
      builder: (_, snapshot) {
        final searchKey = snapshot.data;
        List<int> filterIcons = icons.keys.toList();
        if (searchKey != null && searchKey.isNotEmpty) {
          final searchKeyRegExp = SearchRegex.searchKeyRegExp(searchKey);
          filterIcons = icons.entries
              .where((element) {
                final name = element.value.name.toLowerCase();
                return searchKeyRegExp.hasMatch(name);
              })
              .map((e) => e.key)
              .toList();
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            mainAxisExtent: 32,
          ),
          itemCount: filterIcons.length,
          itemBuilder: (context, index) {
            final id = filterIcons[index];
            final appIconInfo = icons[id]!;
            final name = appIconInfo.name.replaceAll('_', ' ');
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(appIconInfo);
              },
              child: HoverWrapper(
                borderRadius: BorderRadius.circular(8),
                child: Tooltip(
                  message: name,
                  waitDuration: const Duration(milliseconds: 500),
                  child: Icon(
                    appIconInfo.icon,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

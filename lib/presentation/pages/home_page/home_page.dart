import 'package:algopath_app/config/res/app_icons.dart';
import 'package:algopath_app/presentation/dialog/app_dialog.dart';
import 'package:algopath_app/presentation/dialog/icon_selector/icon_selector_dialog.dart';
import 'package:algopath_app/presentation/widgets/super_sidebar/sidebar.dart';
import 'package:algopath_app/utils/app_icons_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.initialSlug,
    required this.child,
  });

  final String? initialSlug;
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageProvider provider;
  final controller = SuperSidebarController(selectedIndex: 0);

  @override
  void initState() {
    super.initState();
    provider = HomePageProvider(widget.initialSlug);
    provider.addListener(providerListeners);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>.value(
      value: provider,
      child: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SuperSidebar(
              controller: controller,
              sidebarTheme: const SuperSidebarTheme.pinned(
                expandedSize: 260,
                itemHeight: 44,
              ),
              headerItems: [
                SuperSidebarItem(
                  icon: Icons.search,
                  onTap: () {
                    debugPrint('Search');
                  },
                ),
              ],
              items: getSidebarItems(provider),
              child: child!,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }

  List<SuperSidebarItem> getSidebarItems(HomePageProvider provider) {
    final paths = provider.paths;
    final appIconsInfoProvider = AppIconsInfoProvider();

    return [
      SuperSidebarItem(
          icon: AppIcons.home,
          label: 'Home',
          shoOnlyInCollapsed: true,
          onTap: () {
            GoRouter.of(context).go('/');
          }),
      ...paths.map((path) {
        return SuperSidebarItem(
            icon: appIconsInfoProvider[path.iconId ?? 1].icon,
            label: path.name,
            onTap: () {
              final slug = path.slug;
              provider.setSelectedPath(slug);
              GoRouter.of(context).go('/path/$slug');
            },
            onIconTap: () {
              AppDialog.def(
                width: 550,
                height: 400,
                child: const IconSelectorDialog(),
              ).show(context).then((value) {
                debugPrint('value: $value');
              });
            });
      })
    ];
  }

  void providerListeners() {
    if (provider.selectedIndex != null && provider.selectedIndex! > 0) {
      /// Plus 1 because the first item is the home item and is hidden in the sidebar on expanded mode
      controller.selectIndex(provider.selectedIndex! + 1);
    }
  }

  @override
  void dispose() {
    provider.removeListener(providerListeners);
    super.dispose();
  }
}

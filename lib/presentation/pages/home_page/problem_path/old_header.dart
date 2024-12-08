import 'package:algopath_app/config/res/app_dimens.dart';
import 'package:algopath_app/config/res/res.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/widgets/panel/problem_info_cards.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/widgets/search/problem_search_delegate.dart';
import 'package:flutter/material.dart';

class ProblemPathPage extends StatelessWidget {
  const ProblemPathPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            width: size.width * 0.22,
            color: Colors.red.shade100,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(slug),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProblemSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Row(
                    children: [
                      Icon(Icons.sort, size: 24),
                      SizedBox(width: 8),
                      Text('Sort by'),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.sort_by_alpha),
                        title: const Text('Name'),
                        onTap: () {
                          // Handle name sort
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.numbers),
                        title: const Text('Number'),
                        onTap: () {
                          // Handle number sort
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.trending_up),
                        title: const Text('Difficulty'),
                        onTap: () {
                          // Handle difficulty sort
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 20),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'filter',
                child: Row(
                  children: [
                    Icon(Icons.filter_list, size: 20),
                    SizedBox(width: 8),
                    Text('Filter'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'view',
                child: Row(
                  children: [
                    Icon(Icons.view_list, size: 20),
                    SizedBox(width: 8),
                    Text('View Options'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'settings':
                  // Handle settings
                  break;
                case 'filter':
                  // Handle filter
                  break;
                case 'view':
                  // Handle view options
                  break;
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        width: 1200,
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverProblemPathHeader(),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

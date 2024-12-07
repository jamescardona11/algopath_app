import 'package:algopath_app/config/res/app_dimens.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/header/progress_header.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';
import 'package:flutter/material.dart';

import 'panel/right_info_panel.dart';

class ProblemPathPage extends StatelessWidget {
  const ProblemPathPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: ProgressHeader(
                    completed: 3,
                    total: 75,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickySearchDelegate(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    const ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    const ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    const ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    const ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    const ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    const ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    const ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    const ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    const ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    const ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    const ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const RightInfoPanel(),
        ],
      ),
    );
  }
}

class _StickySearchDelegate extends SliverPersistentHeaderDelegate {
  final double height = 49.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: overlapsContent
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: const ProblemPathSearch(),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ProblemPathSearch extends StatelessWidget {
  const ProblemPathSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: 8,
      ),
      child: Row(
        children: [
          _buildFilterButton(
            context,
            'Based on Preferences',
            Icons.arrow_drop_down,
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            context,
            'Order by Difficulty',
            Icons.arrow_drop_down,
          ),
          const SizedBox(width: 8),
          _buildFilterButton(
            context,
            'Group by Weeks',
            Icons.arrow_drop_down,
          ),
          const Spacer(),
          _buildTopicsButton(context),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context, String text, IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[800],
                ),
          ),
          Icon(
            icon,
            color: Colors.grey[800],
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      child: Text(
        'Show topics',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[800],
            ),
      ),
    );
  }
}

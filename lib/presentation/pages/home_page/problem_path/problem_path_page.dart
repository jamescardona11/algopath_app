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

class ProblemPathSearch extends StatefulWidget {
  const ProblemPathSearch({super.key});

  @override
  State<ProblemPathSearch> createState() => _ProblemPathSearchState();
}

class _ProblemPathSearchState extends State<ProblemPathSearch> with SingleTickerProviderStateMixin {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _searchAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _searchAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _animationController.forward();
        Future.delayed(const Duration(milliseconds: 100), () {
          _focusNode.requestFocus();
        });
      } else {
        _animationController.reverse();
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: 8,
      ),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: _isSearching ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
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
                const SizedBox(width: 8),
                _buildSearchButton(context),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: _isSearching ? 0 : MediaQuery.of(context).size.width,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isSearching ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: _buildSearchField(context),
            ),
          ),
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

  Widget _buildSearchButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: _toggleSearch,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(12),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return SizeTransition(
      sizeFactor: _searchAnimation,
      axis: Axis.horizontal,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(
              Icons.search,
              size: 20,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
                decoration: InputDecoration(
                  hintText: 'Search problems...',
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (value) {
                  // Handle search
                },
                onSubmitted: (value) {
                  // Handle search submit
                },
              ),
            ),
            if (_searchController.text.isNotEmpty)
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  _searchController.clear();
                  setState(() {});
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            IconButton(
              icon: Icon(
                Icons.close,
                size: 18,
                color: Colors.grey[600],
              ),
              onPressed: _toggleSearch,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

import 'package:algopath_app/config/res/app_dimens.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';
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
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ProblemPathHeader(
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
                    ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '416',
                      title: 'Partition Equal Subset Sum',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '322',
                      title: 'Coin Change',
                      tags: ['Dynamic Programming', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '124',
                      title: 'Binary Tree Maximum Path Sum',
                      tags: ['Depth-first Search', 'Tree', 'Hard'],
                    ),
                    ProblemListItem(
                      number: '494',
                      title: 'Target Sum',
                      tags: ['Dynamic Programming', 'Depth-first Search', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '1',
                      title: 'Two Sum',
                      tags: ['Easy'],
                    ),
                    ProblemListItem(
                      number: '3',
                      title: 'Longest Substring Without Repeating Characters',
                      tags: ['Two Pointers', 'Medium'],
                    ),
                    ProblemListItem(
                      number: '33',
                      title: 'Search in Rotated Sorted Array',
                      tags: ['Binary Search', 'Medium'],
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.22,
            color: Colors.red.shade100,
          ),
        ],
      ),
    );
  }
}

class _StickySearchDelegate extends SliverPersistentHeaderDelegate {
  final double height = 49.0; // Match the actual content height

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

class ProblemPathHeader extends StatelessWidget {
  const ProblemPathHeader({
    super.key,
    required this.completed,
    required this.total,
  });

  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grind 75 questions',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Customize LeetCode study plans according to your needs. You are recommended to work on the questions in order.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: completed / total,
            backgroundColor: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(
            'COMPLETED $completed / $total',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

class ProblemPathInfo extends StatelessWidget {
  const ProblemPathInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDimens.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Questions Summary',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const Divider(height: 1),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildTimeNeeded(context),
                ),
                VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade200,
                ),
                Expanded(
                  child: _buildDifficulty(context),
                ),
                VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade200,
                ),
                Expanded(
                  child: _buildTopics(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeNeeded(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TIME NEEDED',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'How long doing these questions will take for an average person. It\'s a conservative estimate where it is assumed that roughly the same amount of time will be needed to check the answer for each question.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 16),
          Text(
            '64 hours',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            'Fits into your schedule.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.green,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficulty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DIFFICULTY',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Questions grouped by difficulty',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDifficultyItem(context, 'Easy: 24', Colors.green),
              const SizedBox(width: 8),
              _buildDifficultyItem(context, 'Medium: 42', Colors.orange),
              const SizedBox(width: 8),
              _buildDifficultyItem(context, 'Hard: 9', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultyItem(BuildContext context, String text, Color color) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildTopics(BuildContext context) {
    final topics = [
      ['Array: 11', 'Binary: 1', 'Binary Search: 5', 'Binary Search Tree: 3'],
      ['Binary Tree: 9', 'Dynamic Programming: 5', 'Graph: 10'],
      ['Hash Table: 1', 'Heap: 4', 'Linked List: 5', 'Matrix: 1'],
      ['Recursion: 3', 'Stack: 7', 'String: 8', 'Trie: 2'],
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOPICS',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Questions grouped by topics',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 16),
          ...topics.map((row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: row
                    .map((topic) => Expanded(
                          child: Text(
                            topic,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ))
                    .toList(),
              ),
            );
          }),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
              children: [
                const TextSpan(text: 'Need study resources? Check out '),
                TextSpan(
                  text: 'Tech Interview Handbook\'s algorithm study cheatsheets',
                  style: TextStyle(color: Colors.blue[700]),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ],
      ),
    );
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

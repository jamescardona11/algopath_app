import 'package:algopath_app/config/res/res.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';
import 'package:flutter/material.dart';

import 'header/problem_path_header.dart';

class ProblemPathPage extends StatelessWidget {
  const ProblemPathPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 1200,
        padding: EdgeInsets.all(AppDimens.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProblemPathHeader(),
            const SizedBox(height: 40),
            Expanded(
              child: SizedBox(
                // width: 1250,
                child: ListView(
                  children: [
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

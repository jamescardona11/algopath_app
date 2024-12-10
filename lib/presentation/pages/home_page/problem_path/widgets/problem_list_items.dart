import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';
import 'package:flutter/material.dart';

class ProblemListItems extends StatelessWidget {
  const ProblemListItems({
    super.key,
    required this.problems,
  });

  final List<Problem> problems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final problem = problems[index];

          return ProblemItem(
            number: problem.id.toString(),
            title: problem.title,
            tags: problem.topicTags,
          );
        },
        childCount: problems.length,
      ),
    );
  }
}

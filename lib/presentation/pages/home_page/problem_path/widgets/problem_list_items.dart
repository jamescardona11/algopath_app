import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem/topic_tag/topic_tag.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ProblemListItems extends StatelessWidget {
  const ProblemListItems({
    super.key,
    required this.problems,
    required this.topicTags,
  });

  final List<Problem> problems;
  final Map<String, TopicTag> topicTags;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final problem = problems[index];
          final tags = problem.topicTags.map((tag) => topicTags[tag]).whereNotNull().toList();

          return ProblemItem(
            problem: problem,
            tags: tags,
          );
        },
        childCount: problems.length,
      ),
    );
  }
}

import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem/topic_tag/topic_tag.dart';
import 'package:algopath_app/utils/color_generator.dart';
import 'package:flutter/material.dart';

class ProblemItem extends StatelessWidget {
  final Problem problem;
  final List<TopicTag> tags;
  final VoidCallback? onChatPressed;
  final VoidCallback? onBookmarkPressed;

  const ProblemItem({
    super.key,
    required this.problem,
    required this.tags,
    this.onChatPressed,
    this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                problem.id.toString(),
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problem.title,
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((tag) {
                      final (boxColor, textColor) = ColorGenerator.getPairColor(Color(tag.color));

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag.name,
                          style: textTheme.bodySmall?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onChatPressed,
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: onBookmarkPressed,
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

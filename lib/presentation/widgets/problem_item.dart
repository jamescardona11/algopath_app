import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem/topic_tag/topic_tag.dart';
import 'package:algopath_app/utils/color_generator.dart';
import 'package:flutter/material.dart';

class ProblemItem extends StatelessWidget {
  final Problem problem;
  final List<TopicTag> tags;
  final VoidCallback? onChatPressed;

  const ProblemItem({
    super.key,
    required this.problem,
    required this.tags,
    this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problem.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
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
                  tooltip: 'Add to chat context',
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

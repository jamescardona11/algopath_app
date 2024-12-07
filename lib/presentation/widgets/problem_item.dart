import 'package:flutter/material.dart';

class ProblemListItem extends StatelessWidget {
  final String number;
  final String title;
  final List<String> tags;
  final VoidCallback? onChatContext;

  const ProblemListItem({
    super.key,
    required this.number,
    required this.title,
    required this.tags,
    this.onChatContext,
  });

  Color getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'dynamic programming':
        return Colors.green.shade100;
      case 'depth-first search':
        return Colors.orange.shade100;
      case 'tree':
        return Colors.blue.shade100;
      case 'two pointers':
        return Colors.purple.shade100;
      case 'binary search':
        return Colors.pink.shade100;
      case 'easy':
        return Colors.green.shade100;
      case 'medium':
        return Colors.orange.shade100;
      case 'hard':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color getTagTextColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'dynamic programming':
        return Colors.green.shade700;
      case 'depth-first search':
        return Colors.orange.shade700;
      case 'tree':
        return Colors.blue.shade700;
      case 'two pointers':
        return Colors.purple.shade700;
      case 'binary search':
        return Colors.pink.shade700;
      case 'easy':
        return Colors.green.shade700;
      case 'medium':
        return Colors.orange.shade700;
      case 'hard':
        return Colors.red.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

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
                number,
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
                    title,
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
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: getTagColor(tag),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: getTagTextColor(tag),
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
                  onPressed: onChatContext,
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

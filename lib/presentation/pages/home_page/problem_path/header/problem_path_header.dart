import 'package:flutter/material.dart';

import 'problem_calendar.dart';
import 'progress_card.dart';

class ProblemPathHeader extends StatelessWidget {
  const ProblemPathHeader({
    super.key,
    required this.shrinkOffset,
    required this.overlapsContent,
  });

  final double shrinkOffset;
  final bool overlapsContent;

  @override
  Widget build(BuildContext context) {
    final progress = shrinkOffset;
    
    return Material(
      elevation: overlapsContent ? 4.0 : 0.0,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: (1.0 - progress).clamp(0.0, 1.0) * 200,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: (1.0 - progress).clamp(0.0, 1.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProgressCard(
                        title: 'Easy Problems',
                        bulletPoints: const [
                          '2 problems left',
                          '3 problems solved',
                        ],
                        progress: 0.87,
                        backgroundColor: Colors.blue.shade50,
                        icon: Icons.code,
                      ),
                      const SizedBox(width: 16),
                      ProgressCard(
                        title: 'Medium Problems',
                        bulletPoints: const [
                          '4 problems left',
                          '5 problems solved',
                        ],
                        progress: 0.48,
                        backgroundColor: Colors.orange.shade50,
                        icon: Icons.code_outlined,
                      ),
                      const SizedBox(width: 16),
                      ProgressCard(
                        title: 'Hard Problems',
                        bulletPoints: const [
                          '6 problems left',
                          '2 problems solved',
                        ],
                        progress: 0.73,
                        backgroundColor: Colors.red.shade50,
                        icon: Icons.code_off_outlined,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
            const IntrinsicWidth(child: ProblemCalendar()),
          ],
        ),
      ),
    );
  }
}

class SliverProblemPathHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ProblemPathHeader(
      shrinkOffset: shrinkOffset / (maxExtent - minExtent),
      overlapsContent: overlapsContent,
    );
  }

  @override
  double get maxExtent => 400.0;

  @override
  double get minExtent => 150.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

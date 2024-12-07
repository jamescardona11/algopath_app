import 'package:flutter/material.dart';

import 'problem_calendar.dart';
import 'progress_card.dart';

class ProblemPathHeader extends StatelessWidget {
  const ProblemPathHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        ProblemCalendar(),
      ],
    );
  }
}

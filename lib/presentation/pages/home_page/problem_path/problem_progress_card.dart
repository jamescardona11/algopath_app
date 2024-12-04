import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProblemProgressCard extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  final double progress;

  final IconData icon;

  const ProblemProgressCard({
    super.key,
    required this.title,
    required this.bulletPoints,
    required this.progress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...bulletPoints.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Text('• '),
                  Text(
                    point,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.black.withOpacity(0.1),
                  color: Colors.black.withOpacity(0.3),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(progress * 100).round()}%',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

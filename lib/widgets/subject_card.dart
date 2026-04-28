import 'package:flutter/material.dart';
import '../models/subject_model.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
    required this.formulaCount,
    required this.onTap,
  });

  final SubjectModel subject;
  final int formulaCount;
  final VoidCallback onTap;

  static const _icons = {
    'math': Icons.calculate_rounded,
    'physics': Icons.science_rounded,
    'cs': Icons.computer_rounded,
  };

  static const _gradients = {
    'math': [Color(0xFF1565C0), Color(0xFF42A5F5)],
    'physics': [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
    'cs': [Color(0xFF00695C), Color(0xFF26A69A)],
  };

  @override
  Widget build(BuildContext context) {
    final gradientColors =
        _gradients[subject.id] ?? [Colors.blue, Colors.lightBlue];
    final icon = _icons[subject.id] ?? Icons.book_rounded;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withAlpha(80),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: Colors.white, size: 36),
                  const SizedBox(height: 12),
                  Text(
                    subject.nameKk,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$formulaCount формула',
                    style: TextStyle(
                      color: Colors.white.withAlpha(200),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

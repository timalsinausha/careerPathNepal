import 'package:flutter/material.dart';

class CustomTopSkills extends StatelessWidget {
  final List<String> skills;

  const CustomTopSkills({super.key, required this.skills});

  static const List<Color> _chipColors = [
    Color(0xFFE8F5E9),
    Color(0xFFFFF3E0),
    Color(0xFFE3F2FD),
    Color(0xFFFCE4EC),
  ];

  static const List<Color> _textColors = [
    Color(0xFF34A853),
    Color(0xFFFF9800),
    Color(0xFF1A73E8),
    Color(0xFFE91E63),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Top Skills',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.asMap().entries.map((entry) {
              final i = entry.key % _chipColors.length;
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: _chipColors[i],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    fontSize: 12,
                    color: _textColors[i],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
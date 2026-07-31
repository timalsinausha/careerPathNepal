import 'package:flutter/material.dart';

class ResultProgressTile extends StatelessWidget {
  final String attribute;
  final double percentage;

  const ResultProgressTile({
    super.key,
    required this.attribute,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Expanded(
                child: Text(
                  attribute,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),

              Text(
                "${percentage.toStringAsFixed(0)}%",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0F62BC),
                ),
              ),

            ],
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: percentage / 100,

              minHeight: 10,

              backgroundColor: Colors.grey.shade300,

              valueColor: const AlwaysStoppedAnimation(
                Color(0xff0F62BC),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
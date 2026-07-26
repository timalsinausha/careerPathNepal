import 'package:careernepal/widgets/custom_circular_score.dart';
import 'package:flutter/material.dart';
import '../auth/career_result_model.dart';


class CustomCareerMatchCard extends StatelessWidget {
  final CareerResultModel result;

  const CustomCareerMatchCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Best Match badge + Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Best Match Badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified,
                            size: 14, color: Color(0xFF34A853)),
                        SizedBox(width: 4),
                        Text(
                          'Best Match',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF34A853),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Job Title
                  Text(
                    result.jobTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Description
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      result.jobDescription,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              // Circular Score
              CustomCircularScore(score: result.matchPercent),
            ],
          ),

          const SizedBox(height: 14),
          const Divider(color: Color(0xFFF0F0F0)),
          const SizedBox(height: 10),

          // Career Outlook row
          const Row(
            children: [
              Icon(Icons.trending_up, size: 16, color: Color(0xFF1A73E8)),
              SizedBox(width: 6),
              Text(
                'Career Outlook',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF1A73E8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios,
                  size: 12, color: Color(0xFF1A73E8)),
            ],
          ),
        ],
      ),
    );
  }
}
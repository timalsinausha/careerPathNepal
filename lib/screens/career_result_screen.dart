import 'package:careernepal/widgets/custom_career_match_card.dart';
import 'package:careernepal/widgets/custom_recommended_courses.dart';
import 'package:careernepal/widgets/custom_top_colleges.dart';
import 'package:careernepal/widgets/custom_top_skills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/career_result_provider.dart';


class CareerResultScreen extends StatelessWidget {
  const CareerResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CareerResultProvider>();
    final result = provider.result;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF1A1A2E), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Your Career Result',
          style: TextStyle(
            color: Color(0xFF1A1A2E),
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  // Great Job header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          result.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'We found the best career\npath for you.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF888888),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Career match card
                  CustomCareerMatchCard(result: result),

                  const SizedBox(height: 4),

                  // Recommended Courses
                  CustomRecommendedCourses(courses: result.recommendedCourses),

                  const SizedBox(height: 4),

                  // Top Colleges
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomTopColleges(colleges: result.topColleges),
                  ),

                  // Top Skills
                  CustomTopSkills(skills: result.topSkills),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          _BottomButtons(
            onRetake: () => provider.retakeQuiz(context),
            onExplore: () => provider.exploreCareer(context),
          ),
        ],
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  final VoidCallback onRetake;
  final VoidCallback onExplore;

  const _BottomButtons({
    required this.onRetake,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Retake Quiz button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onRetake,
              icon: const Icon(Icons.refresh_rounded,
                  size: 16, color: Color(0xFF1A73E8)),
              label: const Text(
                'Retake Quiz',
                style: TextStyle(
                  color: Color(0xFF1A73E8),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Color(0xFF1A73E8), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Explore Career button
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: onExplore,
              icon: const Text(
                'Explore Career',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              label: const Icon(Icons.arrow_forward_rounded,
                  size: 18, color: Colors.white),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A73E8),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
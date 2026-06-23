import 'package:flutter/material.dart';
import '../models/career_result_model.dart';

class CareerResultProvider extends ChangeNotifier {
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  final CareerResultModel result = const CareerResultModel(
    title: 'Great Job! 🎉',
    jobTitle: 'Software Engineer',
    jobDescription:
        'You have strong problem-solving skills, analytical mindset, and great interest in building products using surveys, skills and interest-based results.',
    matchPercent: 85,
    skills: ['Problem Solving', 'Logical Thinking', 'Technology Interest', 'Detail Based'],
    recommendedCourses: ['BSc CS/IT', 'BIT', 'BCA', 'BSc in Computer'],
    topColleges: [
      CollegeModel(
        name: 'Islington College',
        rating: 4.5,
        location: 'Kathmandu',
        type: 'Private',
      ),
      CollegeModel(
        name: 'Softwarica College',
        rating: 4.3,
        location: 'Kathmandu',
        type: 'Private',
      ),
      CollegeModel(
        name: 'NIST College',
        rating: 4.4,
        location: 'Lalitpur',
        type: 'Private',
      ),
    ],
    topSkills: ['Problem Solving', 'Logical Thinking', 'Technology Interest', 'Detail Based'],
  );

  void retakeQuiz(BuildContext context) {
    Navigator.pop(context);
  }

  void exploreCareer(BuildContext context) {
    // Navigate to career detail screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exploring career details...'),
        backgroundColor: Color(0xFF1A73E8),
      ),
    );
  }
}
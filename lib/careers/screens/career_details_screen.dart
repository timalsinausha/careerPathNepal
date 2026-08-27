import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../college/screen/college_details_screen.dart';
import '../../course/screen/course_details_screen.dart';
import '../providers/career_provider.dart';

class CareerDetailScreen extends StatefulWidget {
  final String slug;
  final double matchScore;

  const CareerDetailScreen({
    super.key,
    required this.slug,
    required this.matchScore,
  });

  @override
  State<CareerDetailScreen> createState() =>
      _CareerDetailScreenState();
}

class _CareerDetailScreenState
    extends State<CareerDetailScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CareerProvider>()
          .loadCareer(widget.slug);
    });
  }
  

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<CareerProvider>();

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (provider.error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(provider.error!),
        ),
      );
    }

    final career = provider.career;

    if (career == null) {
      return const Scaffold(
        body: Center(
          child: Text("Career not found"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(career.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            /// Header
            Text(
              career.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Chip(
              avatar: const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              label: Text(
                "${widget.matchScore.toStringAsFixed(0)}% Match",
              ),
            ),

            const SizedBox(height: 24),

            /// About
            const Text(
              "About Career",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              career.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            /// Minimum Education
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text(
                "Minimum Education",
              ),
              subtitle: Text(
                career.minimumEducationLevel,
              ),
            ),

            /// Skills Required
            ListTile(
              leading: const Icon(Icons.psychology),
              title: const Text(
                "Skills Required",
              ),
              subtitle: Text(
                career.skillsRequired,
              ),
            ),

            /// Future Scope
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text(
                "Future Scope",
              ),
              subtitle: Text(
                career.futureScope,
              ),
            ),

            /// Job Demand
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text(
                "Job Demand",
              ),
              subtitle: Text(
                career.jobDemand,
              ),
            ),

            /// Work Environment
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text(
                "Work Environment",
              ),
              subtitle: Text(
                career.workEnvironment,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Recommended Courses",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ...career.recommendedCourses.map(
            //   (course) => Card(
            //     child: ListTile(
            //       leading: const Icon(Icons.book),
            //       title: Text(course.name),
            //       subtitle: Text(course.shortName),
            //     ),
            //   ),
            // ),

            ...career.recommendedCourses.map(
  (course) => Card(
    margin: const EdgeInsets.symmetric(
      vertical: 6,
    ),
    child: ListTile(
      leading: const Icon(
        Icons.book,
      ),

      title: Text(
        course.name,
      ),

      subtitle: Text(
        course.shortName,
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),

      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                CourseDetailScreen(
              slug: course.slug,
            ),
          ),
        );
      },
    ),
  ),
),

            const SizedBox(height: 24),

            const Text(
              "Top Colleges",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            // const SizedBox(height: 12),

            // ...career.topColleges.map(
            //   (college) => Card(
            //     child: ListTile(
            //       leading:
            //           const Icon(Icons.school),
            //       title: Text(college.name),
            //       subtitle: Text(
            //         "${college.district}, ${college.province}",
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 12),

            ...career.topColleges.map(
              (college) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(
                    Icons.school,
                    size: 30,
                  ),

                  title: Text(
                    college.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  subtitle: Text(
                    "${college.district}, ${college.province}",
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),

                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CollegeDetailScreen(
                          slug: college.slug,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
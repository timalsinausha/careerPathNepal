import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../careers/providers/recommendation_provider.dart';
import '../course/screen/course_details_screen.dart';

class RecommendedCoursesScreen
    extends StatelessWidget {
  const RecommendedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<RecommendationProvider>();

    final courses =
        _getCourses(provider);

    return Scaffold(
      backgroundColor:
          const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Recommended Courses",
        ),
      ),

      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : courses.isEmpty
              ? const Center(
                  child: Text(
                    "No recommended courses available.",
                  ),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.all(16),
                  itemCount: courses.length,
                  itemBuilder:
                      (context, index) {
                    final course =
                        courses[index];

                    return Card(
                      margin:
                          const EdgeInsets.only(
                        bottom: 10,
                      ),

                      elevation: 0,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),

                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        leading: Container(
                          padding:
                              const EdgeInsets.all(
                            10,
                          ),

                          decoration:
                              BoxDecoration(
                            color:
                                const Color(
                              0xffEEF2FF,
                            ),
                            borderRadius:
                                BorderRadius.circular(
                              12,
                            ),
                          ),

                          child: const Icon(
                            Icons
                                .menu_book_outlined,
                            color:
                                Color(0xff274CFF),
                          ),
                        ),

                        title: Text(
                          course.name,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          course.shortName,
                        ),

                        trailing:
                            const Icon(
                          Icons
                              .arrow_forward_ios,
                          size: 16,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  CourseDetailScreen(
                                slug:
                                    course.slug,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }

  List<dynamic> _getCourses(
    RecommendationProvider provider,
  ) {
    final courses = <dynamic>[];

    for (final recommendation
        in provider.recommendations) {
      for (final course
          in recommendation.recommendedCourses) {
        final exists = courses.any(
          (item) => item.id == course.id,
        );

        if (!exists) {
          courses.add(course);
        }
      }
    }

    return courses;
  }
}
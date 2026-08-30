import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assessment/screen/assement_intro_screen.dart';
import '../careers/providers/recommendation_provider.dart';
import '../careers/screens/career_details_screen.dart';
import '../college/screen/college_details_screen.dart';
import '../course/screen/course_details_screen.dart';
import 'recommendedCollege_screen.dart';
import 'recommendedcourse_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<RecommendationProvider>()
          .loadRecommendations();
    });
  }
  List<dynamic> getRecommendedCourses(
  RecommendationProvider provider,
) {
  final courses = <dynamic>[];

  for (final recommendation
      in provider.recommendations) {
    for (final course
        in recommendation.recommendedCourses) {
      final alreadyExists = courses.any(
        (existing) =>
            existing.id == course.id,
      );

      if (!alreadyExists) {
        courses.add(course);
      }
    }
  }

  return courses.take(5).toList();
}

List<dynamic> getRecommendedColleges(
  RecommendationProvider provider,
) {
  final colleges = <dynamic>[];

  for (final recommendation
      in provider.recommendations) {
    for (final college
        in recommendation.topColleges) {
      final alreadyExists = colleges.any(
        (existing) =>
            existing.id == college.id,
      );

      if (!alreadyExists) {
        colleges.add(college);
      }
    }
  }

  return colleges.take(5).toList();
}

  @override
  Widget build(BuildContext context) {

    final recommendationProvider =
        context.watch<RecommendationProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "CareerPath Nepal",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // =========================================================
              // GREETING
              // =========================================================

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  20,
                  16,
                  8,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Hello 👋",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "Explore your career path and discover opportunities.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // =========================================================
              // ASSESSMENT CARD
              // =========================================================

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color(0xff274CFF),

                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: [

                          Container(
                            padding:
                                const EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withOpacity(
                                0.15,
                              ),

                              borderRadius:
                                  BorderRadius.circular(12),
                            ),

                            child: const Icon(
                              Icons.psychology_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Text(
                              "Discover Your Career Path",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      const Text(
                        "Take our career assessment and discover careers that match your interests, strengths and work style.",

                        style: TextStyle(
                          color: Colors.white,
                          height: 1.4,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AssessmentIntroScreen(),
                            ),);

                          },

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white,

                            foregroundColor:
                                const Color(
                              0xff274CFF,
                            ),

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 13,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),

                          child: const Text(
                            "Take Assessment",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // =========================================================
              // RECOMMENDED CAREERS
              // =========================================================

              _sectionHeader(
                title: "Recommended Careers",
                onViewAll: () {
                  // TODO:
                  // Navigate to all recommendations
                },
              ),

              const SizedBox(height: 12),

              if (recommendationProvider.isLoading)

                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child:
                        CircularProgressIndicator(),
                  ),
                )

              else if (
                recommendationProvider
                    .recommendations
                    .isEmpty
              )

                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  child: Text(
                    "No career recommendations available.",
                  ),
                )

              else

                ...recommendationProvider
                    .recommendations
                    .take(3)
                    .map(
                      (career) => Card(

                        margin:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
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
                            vertical: 6,
                          ),

                          leading: Container(
                            padding:
                                const EdgeInsets.all(
                              10,
                            ),

                            decoration: BoxDecoration(
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
                              Icons.work_outline,
                              color:
                                  Color(0xff274CFF),
                            ),
                          ),

                          title: Text(
                            career.career.name,

                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          subtitle: Padding(
                            padding:
                                const EdgeInsets.only(
                              top: 5,
                            ),

                            child: Text(
                              "${career.displayMatchScore.toStringAsFixed(0)}% Match",
                            ),
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
                                    CareerDetailScreen(
                                  slug: career
                                      .career
                                      .slug,

                                  matchScore: career
                                      .displayMatchScore,
                                ),
                              ),
                            );

                          },
                        ),
                      ),
                    ),

              const SizedBox(height: 28),
              // =========================================================
              // RECOMMENDED COURSES
              // =========================================================

            _sectionHeader(
              title: "Recommended Courses",
              onViewAll: () {
                print("clicked");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecommendedCoursesScreen(),
                  ),
                );
              },
            ),

              const SizedBox(height: 12),

              Builder(
                builder: (context) {
                  final courses =
                      getRecommendedCourses(
                    recommendationProvider,
                  ).take(3).toList();

                  if (courses.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        "No recommended courses available.",
                      ),
                    );
                  }

                  return Column(
                    children: courses.map(
                      (course) => Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),

                          leading: Container(
                            padding:
                                const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xffEEF2FF),
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.menu_book_outlined,
                              color:
                                  Color(0xff274CFF),
                            ),
                          ),

                          title: Text(
                            course.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            course.shortName,
                          ),

                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
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
                    ).toList(),
                  );
                },
              ),
              const SizedBox(height: 28),
              // =========================================================
              // RECOMMENDED COLLEGES
              // =========================================================

              const SizedBox(height: 28),

             _sectionHeader(
              title: "Recommended Colleges",
              onViewAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecommendedCollegesScreen(),
                  ),
                );
              },
            ),
              const SizedBox(height: 12),

              Builder(
                builder: (context) {
                  final colleges =
                      getRecommendedColleges(
                    recommendationProvider,
                  ).take(3).toList();

                  if (colleges.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        "No recommended colleges available.",
                      ),
                    );
                  }

                  return Column(
                    children: colleges.map(
                      (college) => Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),

                          leading: Container(
                            padding:
                                const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xffEEF2FF),
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.school_outlined,
                              color:
                                  Color(0xff274CFF),
                            ),
                          ),

                          title: Text(
                            college.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            "${college.district}, "
                            "${college.province}",
                          ),

                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CollegeDetailScreen(
                                  slug: college.slug,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ).toList(),
                  );
                },
              ),
              const SizedBox(height: 28),

              // =========================================================
              // CAREER TIP
              // =========================================================

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Container(

                  width: double.infinity,

                  padding:
                      const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(16),

                    border: Border.all(
                      color:
                          const Color(0xffE5E7EB),
                    ),
                  ),

                  child: Row(

                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Icon(
                        Icons.lightbulb_outline,
                        color:
                            Color(0xffF59E0B),
                        size: 30,
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            const Text(
                              "Career Tip",
                              style:
                                  TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "Don't choose a career only because it is popular. Consider your interests, strengths and preferred work environment.",

                              style:
                                  TextStyle(
                                color:
                                    Colors.grey.shade700,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // SECTION HEADER
  // =========================================================

  Widget _sectionHeader({
    required String title,
    required VoidCallback onViewAll,
  }) {

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      child: Row(

        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextButton(
            onPressed: onViewAll,

            child: const Text(
              "View All",
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // COURSE CARD
  // =========================================================

  Widget _courseCard(
    BuildContext context, {

    required String name,
    required String shortName,
    required String slug,

  }) {

    return GestureDetector(

      onTap: () {

        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) =>
                CourseDetailScreen(
              slug: slug,
            ),
          ),
        );
      },

      child: Container(

        width: 210,

        margin:
            const EdgeInsets.only(
          right: 12,
        ),

        padding:
            const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(16),

          border: Border.all(
            color:
                const Color(0xffE5E7EB),
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Container(
              padding:
                  const EdgeInsets.all(9),

              decoration: BoxDecoration(
                color:
                    const Color(0xffEEF2FF),

                borderRadius:
                    BorderRadius.circular(10),
              ),

              child: const Icon(
                Icons.menu_book_outlined,
                color:
                    Color(0xff274CFF),
              ),
            ),

            const Spacer(),

            Text(
              shortName,
              style:
                  const TextStyle(
                fontSize: 17,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,

              style: TextStyle(
                fontSize: 12,
                color:
                    Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // COLLEGE CARD
  // =========================================================

  Widget _collegeCard(
    BuildContext context, {

    required String name,
    required String location,
    required String slug,

  }) {

    return Card(

      margin:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      elevation: 0,

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(14),
      ),

      child: ListTile(

        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),

        leading: Container(
          padding:
              const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color:
                const Color(0xffEEF2FF),

            borderRadius:
                BorderRadius.circular(12),
          ),

          child: const Icon(
            Icons.school_outlined,
            color:
                Color(0xff274CFF),
          ),
        ),

        title: Text(
          name,
          maxLines: 1,
          overflow:
              TextOverflow.ellipsis,

          style:
              const TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding:
              const EdgeInsets.only(
            top: 5,
          ),

          child: Text(
            location,
          ),
        ),

        trailing:
            const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),

        onTap: () {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) =>
                  CollegeDetailScreen(
                slug: slug,
              ),
            ),
          );
        },
      ),
    );
  }
}

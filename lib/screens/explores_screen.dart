import 'package:careernepal/careers/screens/career_screen.dart';
import 'package:careernepal/college/screen/collegelist_screen.dart';
import 'package:careernepal/course/screen/courselist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assessment/screen/assement_result_screen.dart';
import '../careers/providers/career_provider.dart';
import '../careers/screens/career_details_screen.dart';
import '../college/provider/college_provider.dart';
import '../college/screen/college_details_screen.dart';
import '../course/provider/course_provider.dart';
import '../course/screen/course_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController =
    TextEditingController();

String _searchQuery = '';

@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<CareerProvider>().loadCareers();
    context.read<CourseProvider>().loadCourses();
    context.read<CollegeProvider>().loadColleges();
  });
}

@override
void dispose() {
  _searchController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Explore",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --------------------------------------------------
            // Search
            // --------------------------------------------------

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffE5E7EB),
                ),
              ),

              child: TextField(
              controller: _searchController,

              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim().toLowerCase();
                });
              },

              decoration: InputDecoration(
                hintText: "Search careers, courses, colleges...",

                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),

                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();

                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,

                border: InputBorder.none,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
            ),
            if (_searchQuery.isNotEmpty)
              _buildSearchResults(context),

            const SizedBox(height: 28),

            // --------------------------------------------------
            // Section title
            // --------------------------------------------------

            const Text(
              "Explore Career Nepal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Discover careers, courses and colleges "
              "to plan your future.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            // --------------------------------------------------
            // Careers
            // --------------------------------------------------

            _exploreCard(
              context,
              icon: Icons.work_outline,
              title: "Careers",
              description:
                  "Explore different career paths and "
                  "find careers that match your interests.",
              onTap: () {
                  Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    CareersScreen(),
                              ),
                            );
                
              },
            ),

            const SizedBox(height: 14),

            // --------------------------------------------------
            // Courses
            // --------------------------------------------------

            _exploreCard(
              context,
              icon: Icons.menu_book_outlined,
              title: "Courses",
              description:
                  "Discover courses, entry requirements "
                  "and study duration.",
              onTap: () {
                Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    CourseScreen(),
                              ),
                            );
              },
            ),

            const SizedBox(height: 14),

            // --------------------------------------------------
            // Colleges
            // --------------------------------------------------

            _exploreCard(
              context,
              icon: Icons.school_outlined,
              title: "Colleges",
              description:
                  "Find colleges offering the courses "
                  "you want to study.",
              onTap: () {
                 Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    CollegeScreen(),
                              ),
                            );
              },
            ),

            const SizedBox(height: 14),

            // --------------------------------------------------
            // Assessment Result
            // --------------------------------------------------

            _exploreCard(
              context,
              icon: Icons.analytics_outlined,
              title: "My Assessment Result",
              description:
                  "View your career recommendations "
                  "and assessment results.",
              onTap: () {
                       Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    AssessmentResultScreen(),
                              ),
                            );
              },
            ),

            const SizedBox(height: 28),

            // --------------------------------------------------
            // Coming Soon
            // --------------------------------------------------

            const Text(
              "More Resources",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: _smallCard(
                    icon: Icons.account_balance_outlined,
                    title: "Universities",
                    onTap: () {
                      // TODO
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _smallCard(
                    icon: Icons.card_giftcard_outlined,
                    title: "Scholarships",
                    onTap: () {
                      // TODO
                    },
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ============================================================
  Widget _exploreCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: const Color(0xffE5E7EB),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Row(
          children: [

            // Icon
            Container(
              height: 52,
              width: 52,

              decoration: BoxDecoration(
                color: const Color(0xffEEF2FF),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: const Color(0xff274CFF),
                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Arrow
            const Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  Widget _smallCard(
    {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: const Color(0xffE5E7EB),
          ),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Icon(
              icon,
              size: 28,
              color: const Color(0xff274CFF),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Explore",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
  return Consumer3<
      CareerProvider,
      CourseProvider,
      CollegeProvider>(
    builder: (
      context,
      careerProvider,
      courseProvider,
      collegeProvider,
      child,
    ) {
      final careers = careerProvider.careers
          .where(
            (career) => career.name
                .toLowerCase()
                .contains(_searchQuery),
          )
          .toList();

      final courses = courseProvider.courses
          .where(
            (course) => course.name
                .toLowerCase()
                .contains(_searchQuery),
          )
          .toList();

      final colleges = collegeProvider.colleges
          .where(
            (college) => college.name
                .toLowerCase()
                .contains(_searchQuery),
          )
          .toList();

      final hasResults =
          careers.isNotEmpty ||
          courses.isNotEmpty ||
          colleges.isNotEmpty;

      if (!hasResults) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
          ),
          child: const Column(
            children: [
              Icon(
                Icons.search_off,
                size: 42,
                color: Colors.grey,
              ),

              SizedBox(height: 10),

              Text(
                'No results found',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 4),

              Text(
                'Try a different search term.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),

          const Text(
            'Search Results',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Careers
          ...careers.map(
            (career) => _searchResultCard(
              context,
              icon: Icons.work_outline,
              title: career.name,
              subtitle: 'Career',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CareerDetailScreen(
                      slug: career.slug,
                    ),
                  ),
                );
              },
            ),
          ),

          // Courses
          ...courses.map(
            (course) => _searchResultCard(
              context,
              icon: Icons.menu_book_outlined,
              title: course.name,
              subtitle: 'Course',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CourseDetailScreen(
                      slug: course.slug,
                    ),
                  ),
                );
              },
            ),
          ),

          // Colleges
          ...colleges.map(
            (college) => _searchResultCard(
              context,
              icon: Icons.school_outlined,
              title: college.name,
              subtitle: 'College',
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

          const SizedBox(height: 20),
        ],
      );
    },
  );
}


Widget _searchResultCard(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: const Color(0xffE5E7EB),
      ),
    ),

    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Row(
          children: [

            Container(
              width: 44,
              height: 44,

              decoration: BoxDecoration(
                color: const Color(0xffEEF2FF),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: const Color(0xff274CFF),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    ),
  );
}
}
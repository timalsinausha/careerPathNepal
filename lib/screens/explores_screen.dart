import 'package:flutter/material.dart';

import '../assessment/screen/assement_result_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                decoration: InputDecoration(
                  hintText:
                      "Search careers, courses, colleges...",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

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
                // TODO: Navigate to CareersScreen
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
                // TODO: Navigate to CoursesScreen
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
                // TODO: Navigate to CollegesScreen
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
  // Large Explore Card
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
  // Small Card
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
}
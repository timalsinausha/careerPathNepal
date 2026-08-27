import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../college/screen/college_details_screen.dart';
import '../provider/course_provider.dart';


class CourseDetailScreen extends StatefulWidget {

  final String slug;

  const CourseDetailScreen({
    super.key,
    required this.slug,
  });

  @override
  State<CourseDetailScreen> createState() =>
      _CourseDetailScreenState();
}

class _CourseDetailScreenState
    extends State<CourseDetailScreen> {

  @override
  void initState() {
    super.initState();
  print("========== COURSE DETAIL SCREEN ==========");
  print("Slug received: '${widget.slug}'");
  print("==========================================");
    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      context
          .read<CourseProvider>()
          .loadCourse(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<CourseProvider>();

    return Scaffold(

      backgroundColor:
          const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text("Course Details"),
      ),

      body: _buildBody(provider),
    );
  }

  Widget _buildBody(
    CourseProvider provider,
  ) {

    if (provider.isLoading) {

      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (provider.error != null) {

      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "Failed to load course.\n\n"
            "${provider.error}",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final course = provider.course;

    if (course == null) {

      return const Center(
        child: Text(
          "Course not found.",
        ),
      );
    }
    print("BUILDING COURSE BODY");
print("Course: ${course.name}");
print("Description: ${course.description}");
print("Entry: ${course.entryRequirement}");
print("Colleges: ${course.colleges.length}");

    return SingleChildScrollView(
      

      padding: const EdgeInsets.all(16),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // Course name
          Text(
            course.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Short name
          Text(
            course.shortName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 20),

          // Description
          _sectionTitle(
            "About Course",
          ),

          const SizedBox(height: 8),

          Text(
            course.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // Course information
          _sectionTitle(
            "Course Information",
          ),

          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(
                    Icons.schedule,
                  ),
                  title: const Text(
                    "Duration",
                  ),
                  subtitle: Text(
                    "${course.durationYears} Years",
                  ),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.school,
                  ),
                  title: const Text(
                    "Level",
                  ),
                  subtitle: Text(
                    course.level,
                  ),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.assignment_turned_in,
                  ),
                  title: const Text(
                    "Entry Requirement",
                  ),
                  subtitle: Text(
                    course.entryRequirement,
                  ),
                ),

              ],
            ),
          ),

          const SizedBox(height: 24),

          // Entry requirement explanation
          _sectionTitle(
            "Eligibility",
          ),

          const SizedBox(height: 8),

          Text(
            "This course requires "
            "${course.entryRequirement} "
            "as the entry education level.",
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),


          const SizedBox(height: 24),

          _sectionTitle(
            "Colleges Offering This Course",
          ),

        const SizedBox(height: 12),

        if (course.colleges.isEmpty)
          const Text(
            "No colleges are currently available for this course.",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

        ...course.colleges.map(
          (college) => Card(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(
                  Icons.school,
                ),
              ),

              title: Text(
                college.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                "${college.address}, "
                "${college.district}, "
                "${college.province}",
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              onTap: () {
                print("clicked");
                print(college.slug);
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

         const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _sectionTitle(
    String title,
  ) {

    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
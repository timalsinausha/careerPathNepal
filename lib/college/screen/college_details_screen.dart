import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../course/screen/course_details_screen.dart';
import '../provider/college_provider.dart';

class CollegeDetailScreen extends StatefulWidget {
  final String slug;

  const CollegeDetailScreen({
    super.key,
    required this.slug,
  });

  @override
  State<CollegeDetailScreen> createState() =>
      _CollegeDetailScreenState();
}

class _CollegeDetailScreenState
    extends State<CollegeDetailScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CollegeProvider>()
          .loadCollege(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<CollegeProvider>();

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "College Details",
        ),
      ),

      body: _buildBody(provider),
    );
  }

  Widget _buildBody(
    CollegeProvider provider,
  ) {

    // Loading
    if (provider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Error
    if (provider.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.error_outline,
                size: 60,
                color: Colors.red,
              ),

              const SizedBox(height: 16),

              const Text(
                "Failed to load college details.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                provider.error!,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  provider.loadCollege(
                    widget.slug,
                  );
                },
                child: const Text(
                  "Try Again",
                ),
              ),
            ],
          ),
        ),
      );
    }

    // No college
    final college = provider.college;

    if (college == null) {
      return const Center(
        child: Text(
          "College not found.",
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ------------------------------------------------
          // College Header
          // ------------------------------------------------

          Center(
            child: Column(
              children: [

                // Logo
                CircleAvatar(
                  radius: 45,
                  backgroundColor:
                      Colors.blue.shade50,
                  child: const Icon(
                    Icons.school,
                    size: 45,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 16),

                // College name
                Text(
                  college.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // Short name
                if (college.shortName.isNotEmpty)
                  Text(
                    college.shortName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ------------------------------------------------
          // About College
          // ------------------------------------------------

          _sectionTitle(
            "About College",
          ),

          const SizedBox(height: 10),

          Text(
            college.description.isNotEmpty
                ? college.description
                : "No description available.",
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 28),

          // ------------------------------------------------
          // University
          // ------------------------------------------------

          _sectionTitle(
            "University",
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.account_balance,
              ),

              title: const Text(
                "Affiliated University",
              ),

              subtitle: Text(
                college.university,
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ------------------------------------------------
          // Location
          // ------------------------------------------------

          _sectionTitle(
            "Location",
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                ListTile(
                  leading: const Icon(
                    Icons.location_city,
                  ),

                  title: const Text(
                    "Province",
                  ),

                  subtitle: Text(
                    college.province,
                  ),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                  ),

                  title: const Text(
                    "District",
                  ),

                  subtitle: Text(
                    college.district,
                  ),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.place,
                  ),

                  title: const Text(
                    "Address",
                  ),

                  subtitle: Text(
                    college.address,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ------------------------------------------------
          // College Information
          // ------------------------------------------------

          _sectionTitle(
            "College Information",
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                if (college.establishedYear != null)
                  ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                    ),

                    title: const Text(
                      "Established",
                    ),

                    subtitle: Text(
                      college.establishedYear
                          .toString(),
                    ),
                  ),

                ListTile(
                  leading: const Icon(
                    Icons.business,
                  ),

                  title: const Text(
                    "Ownership",
                  ),

                  subtitle: Text(
                    college.ownership,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ------------------------------------------------
          // Contact Information
          // ------------------------------------------------

          _sectionTitle(
            "Contact Information",
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                if (college.website.isNotEmpty)
                  ListTile(
                    leading: const Icon(
                      Icons.language,
                    ),

                    title: const Text(
                      "Website",
                    ),

                    subtitle: Text(
                      college.website,
                    ),

                    onTap: () {
                      // We can add URL launcher later.
                    },
                  ),

                if (college.email.isNotEmpty)
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                    ),

                    title: const Text(
                      "Email",
                    ),

                    subtitle: Text(
                      college.email,
                    ),
                  ),

                if (college.phone.isNotEmpty)
                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                    ),

                    title: const Text(
                      "Phone",
                    ),

                    subtitle: Text(
                      college.phone,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

            _sectionTitle("Courses Offered"),

            const SizedBox(height: 12),

            if (college.courses.isEmpty)
              const Text(
                "No courses available.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            else
              ...college.courses.map(
                (course) => Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.menu_book,
                    ),

                    title: Text(
                      course.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/course_provider.dart';
import 'course_details_screen.dart';


class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseProvider>().loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Courses'),
        centerTitle: true,
      ),

      body: Consumer<CourseProvider>(
        builder: (context, provider, child) {

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 50,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Unable to load courses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      provider.error!,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: provider.loadCourses,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Empty
          if (provider.courses.isEmpty) {
            return const Center(
              child: Text(
                'No courses available.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }

          // Course list
          return RefreshIndicator(
            onRefresh: provider.loadCourses,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.courses.length,

              itemBuilder: (context, index) {
                final course = provider.courses[index];

                return _CourseCard(
                  name: course.name,

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
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _CourseCard({
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(16),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),

          child: Row(
            children: [

              // Icon
              Container(
                width: 48,
                height: 48,

                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,

                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: Icon(
                  Icons.school_outlined,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
              ),

              const SizedBox(width: 16),

              // Course name
              Expanded(
                child: Text(
                  name,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
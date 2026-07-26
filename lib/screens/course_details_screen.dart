import 'package:flutter/material.dart';
import '../auth/course_model.dart';

class CourseDetailScreen extends StatelessWidget {
  final CourseModel course;

  const CourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),

      appBar: AppBar(
        title: Text(course.name),
        backgroundColor: const Color(0xff274CFF),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Course Image
            ClipRRect(
              child: Image.network(
                course.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  /// Course Name
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    course.fullName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Information Card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        children: [

                          infoRow(
                            Icons.account_balance,
                            "University",
                            course.university,
                          ),

                          const Divider(),

                          infoRow(
                            Icons.schedule,
                            "Duration",
                            course.duration,
                          ),

                          const Divider(),

                          infoRow(
                            Icons.school,
                            "Eligibility",
                            course.eligibility,
                          ),

                          const Divider(),

                          infoRow(
                            Icons.attach_money,
                            "Estimated Fee",
                            course.fee,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Description
                  const Text(
                    "Course Overview",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${course.name} is a professional undergraduate program designed to develop practical and theoretical knowledge in the field. Students gain strong technical skills along with problem-solving and analytical abilities.",
                    style: const TextStyle(
                      height: 1.6,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Skills
                  const Text(
                    "Skills You Will Learn",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: course.skills
                        .map(
                          (skill) => Chip(
                            label: Text(skill),
                            backgroundColor:
                                const Color(0xff274CFF).withOpacity(.1),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 25),

                  /// Career Opportunities
                  const Text(
                    "Career Opportunities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text("Software Engineer"),
                  ),

                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text("Web Developer"),
                  ),

                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text("System Analyst"),
                  ),

                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text("Database Administrator"),
                  ),

                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text("IT Officer"),
                  ),

                  const SizedBox(height: 20),

                  /// Top Colleges
                  const Text(
                    "Top Colleges Offering This Course",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.school),
                      ),
                      title: const Text("Islington College"),
                      subtitle: const Text("Kathmandu"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.school),
                      ),
                      title: const Text("NIST College"),
                      subtitle: const Text("Banepa"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.school),
                      ),
                      title: const Text("Kathmandu University"),
                      subtitle: const Text("Dhulikhel"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff274CFF),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),

                      onPressed: () {},

                      icon: const Icon(
                        Icons.school,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Apply Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ],
    ),
      ),
    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Row(
      children: [

        Icon(
          icon,
          color: const Color(0xff274CFF),
        ),

        const SizedBox(width: 12),

        Text(
          "$title :",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        Text(value),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'college_screen.dart';

class CollegeDetailScreen extends StatelessWidget {
  final College college;

  const CollegeDetailScreen({
    super.key,
    required this.college,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      appBar: AppBar(
        title: const Text(
          "College Details",
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff274CFF),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // College Image
            Image.network(
              college.image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    college.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        college.location,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          detailRow(
                            "Affiliated",
                            college.affiliation,
                          ),
                          detailRow(
                            "Category",
                            college.category,
                          ),
                          detailRow(
                            "Annual Fee",
                            college.fee,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "About College",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${college.name} provides quality education with modern facilities. "
                    "The college offers various undergraduate programs focused on "
                    "technology, management and professional skills.",
                    style: const TextStyle(
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Courses Offered",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: college.programs
                        .map(
                          (course) => Card(
                            child: ListTile(
                              leading: const Icon(
                                Icons.book,
                                color: Color(0xff274CFF),
                              ),
                              title: Text(
                                course,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                "4 Years • Software Development",
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone),
                        label: const Text(
                          "Contact",
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.language),
                        label: const Text(
                          "Website",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

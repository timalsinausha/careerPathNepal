import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),

                const Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 15,
                  top: 10,
                  bottom: 30,
                ),

                child: const Text(
                  "CareerPathNepal is a career guidance platform designed to help students make better and more informed decisions about their education and future careers.\n\n"
                  "Choosing the right career can be challenging, especially when students are unsure about their interests, strengths, skills, and available opportunities. CareerPathNepal aims to make this process easier by providing personalized career recommendations based on the user's assessment results.\n\n"
                  "Our platform provides a career assessment that helps students understand their interests, personality traits, work preferences, values, and abilities. Based on the assessment results, the system recommends career paths that best match the student's profile.\n\n"
                  "CareerPathNepal also provides useful information about different careers, including career descriptions, required skills, future scope, job demand, work environment, courses, and educational opportunities. Students can explore colleges and courses available in Nepal and learn about scholarship opportunities that may help them continue their education.\n\n"
                  "Our goal is to provide students with a simple and accessible platform where they can explore their options, understand themselves better, and make confident decisions about their education and career.\n\n"
                  "We believe that every student has unique strengths and interests. With the right information and guidance, students can choose a career path that matches their abilities and goals.\n\n"
                  "If you have any questions, suggestions, or feedback about CareerPathNepal, please feel free to contact our team. We are continuously working to improve the platform and provide better career guidance for students across Nepal.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


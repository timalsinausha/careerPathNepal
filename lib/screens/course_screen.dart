// import 'package:careernepal/screens/course_details_screen.dart';
// import 'package:flutter/material.dart';
// import '../auth/course_model.dart';

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key});

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
//   String search = "";

//   final List<CourseModel> courses = [
//     CourseModel(
//       name: "BSc CSIT",
//       fullName:
//           "Bachelor of Science in Computer Science and Information Technology",
//       university: "Tribhuvan University",
//       duration: "4 Years",
//       fee: "Rs. 4-6 Lakhs",
//       eligibility: "+2 Science",
//       image: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3",
//       skills: [
//         "Programming",
//         "Networking",
//         "Database",
//       ],
//     ),
//      CourseModel(
//       name: "BCA",
//       fullName: "Bachelor in Computer Application",
//       university: "Tribhuvan University",
//       duration: "4 Years",
//       fee: "Rs. 4-5 Lakhs",
//       eligibility: "+2 Any Stream",
//       image: "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
//       skills: [
//         "Programming",
//         "Web Development",
//       ],
//     ),
//      CourseModel(
//       name: "BIT",
//       fullName: "Bachelor in Information Technology",
//       university: "PU / Foreign",
//       duration: "4 Years",
//       fee: "Rs. 7-10 Lakhs",
//       eligibility: "+2",
//       image: "https://images.unsplash.com/photo-1518770660439-4636190af475",
//       skills: [
//         "AI",
//         "Cyber Security",
//         "Cloud",
//       ],
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final filtered = courses.where((course) {
//       return course.name.toLowerCase().contains(search.toLowerCase());
//     }).toList();

//     return Scaffold(
//       backgroundColor: const Color(0xffF8FAFF),
//       appBar: AppBar(
//         title: const Text("Courses"),
//         backgroundColor: const Color(0xff274CFF),
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   search = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: "Search Courses",
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filtered.length,
//                 itemBuilder: (_, index) {
//                   return CourseCard(
//                     course: filtered[index],
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CourseCard extends StatefulWidget {
//   final CourseModel course;

//   const CourseCard({
//     super.key,
//     required this.course,
//   });

//   @override
//   State<CourseCard> createState() => _CourseCardState();
// }

// class _CourseCardState extends State<CourseCard> {
//   bool favorite = false;

//   @override
//   Widget build(BuildContext context) {
//     final course = widget.course;


//     return InkWell(
//   borderRadius: BorderRadius.circular(18),
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => CourseDetailScreen(
//           course: course,
//         ),
//       ),
//     );
//   },

//      child:Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18),
//       ),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 28,
//                   backgroundColor: const Color(0xff274CFF),
//                   child: const Icon(
//                     Icons.school,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         course.name,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(course.fullName),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       favorite = !favorite;
//                     });
//                   },
//                   icon: Icon(
//                     favorite ? Icons.favorite : Icons.favorite_border,
//                     color: Colors.red,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 const Icon(Icons.account_balance, size: 18),
//                 const SizedBox(width: 6),
//                 Text(course.university),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Row(
//               children: [
//                 const Icon(Icons.schedule, size: 18),
//                 const SizedBox(width: 6),
//                 Text(course.duration),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Row(
//               children: [
//                 const Icon(Icons.attach_money, size: 18),
//                 const SizedBox(width: 6),
//                 Text(course.fee),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Wrap(
//               spacing: 8,
//               children: course.skills.map((skill) {
//                 return Chip(
//                   label: Text(skill),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   // Navigate to Course Detail Screen
//                 },
//                 child: const Text("View Details"),
//               ),
//             )
//           ],
//         ),
//       ),
//      )
//     );
//   }
// }

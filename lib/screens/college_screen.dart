import 'package:careernepal/screens/college_details_screen.dart';
import 'package:flutter/material.dart';

class CollegeScreen extends StatefulWidget {
  const CollegeScreen({super.key});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  String searchText = "";

  final TextEditingController searchController = TextEditingController();

  final List<College> colleges = [
    College(
      name: "Islington College",
      location: "Kamalpokhari, Kathmandu",
      affiliation: "London Metropolitan University",
      category: "Foreign Affiliated",
      fee: "Rs. 10-15 Lakhs",
      image: "https://images.unsplash.com/photo-1564981797816-1043664bf78d",
      programs: [
        "BSc Computer Science",
        "BSc Computing",
        "BBA",
      ],
      phone: "01-4532111",
      website: "www.islington.edu.np",
    ),
    College(
      name: "NIST College",
      location: "Banepa",
      affiliation: "Tribhuvan University",
      category: "TU Affiliated",
      fee: "Rs. 5-8 Lakhs",
      image: "https://images.unsplash.com/photo-1541339907198-e08756dedf3f",
      programs: [
        "BSc CSIT",
        "BCA",
        "BITM",
      ],
      phone: "011-661234",
      website: "www.nist.edu.np",
    ),
    College(
      name: "Kathmandu University",
      location: "Dhulikhel",
      affiliation: "Kathmandu University",
      category: "KU Affiliated",
      fee: "Rs. 8-12 Lakhs",
      image: "https://images.unsplash.com/photo-1607237138185-eedd9c632b0b",
      programs: [
        "Computer Engineering",
        "BBA",
        "Science Programs",
      ],
      phone: "011-415200",
      website: "www.ku.edu.np",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCollege = colleges.where((college) {
      return college.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      appBar: AppBar(
        title: const Text("Colleges"),
        centerTitle: true,
        backgroundColor: const Color(0xff274CFF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search colleges...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCollege.length,
                itemBuilder: (context, index) {
                  return CollegeCard(
                    college: filteredCollege[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollegeCard extends StatefulWidget {
  final College college;

  const CollegeCard({
    super.key,
    required this.college,
  });

  @override
  State<CollegeCard> createState() => _CollegeCardState();
}

class _CollegeCardState extends State<CollegeCard> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final college = widget.college;
      return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CollegeDetailScreen(
            college: college,
          ),
        ),
      );
    },

    child:Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Image.network(
              college.image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        college.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff274CFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    college.category,
                    style: const TextStyle(
                      color: Color(0xff274CFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Affiliated: ${college.affiliation}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
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
                const SizedBox(height: 8),
                Text(
                  "Fee: ${college.fee}",
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: college.programs
                      .map(
                        (program) => Chip(
                          label: Text(program),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.map),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Opening Maps..."),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(college.phone),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.language),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(college.website),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )
    );
      
  }
}

class College {
  final String name;

  final String location;

  final String affiliation;

  final String category;

  final String fee;

  final String image;

  final List<String> programs;

  final String phone;

  final String website;

  College({
    required this.name,
    required this.location,
    required this.affiliation,
    required this.category,
    required this.fee,
    required this.image,
    required this.programs,
    required this.phone,
    required this.website,
  });
}

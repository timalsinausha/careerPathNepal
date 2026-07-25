import 'package:flutter/material.dart';

class LocationProfilePage extends StatefulWidget {
  const LocationProfilePage({super.key});

  @override
  State<LocationProfilePage> createState() =>
      _LocationProfilePageState();
}

class _LocationProfilePageState extends State<LocationProfilePage> {
  String? budget;
  String? province;
  String? district;

  final budgets = [
    'Below Rs. 50,000',
    'Rs. 50,000 - 100,000',
    'Rs. 100,000 - 300,000',
    'Above Rs. 300,000',
  ];

  final provinces = [
    'Koshi',
    'Madhesh',
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpashchim',
  ];

  final districts = [
    'Kathmandu',
    'Lalitpur',
    'Bhaktapur',
    'Chitwan',
    'Pokhara',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const LinearProgressIndicator(value: 1),

            const SizedBox(height: 30),

            DropdownButtonFormField(
              value: budget,
              decoration: const InputDecoration(
                labelText: "Budget",
                border: OutlineInputBorder(),
              ),
              items: budgets
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  budget = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: province,
              decoration: const InputDecoration(
                labelText: "Home Province",
                border: OutlineInputBorder(),
              ),
              items: provinces
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  province = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: district,
              decoration: const InputDecoration(
                labelText: "Home District",
                border: OutlineInputBorder(),
              ),
              items: districts
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  district = value!;
                });
              },
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save Profile
                    },
                    child: const Text("Save"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
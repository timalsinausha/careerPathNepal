import 'package:flutter/material.dart';
import '../models/career_result_model.dart';

class CustomTopColleges extends StatelessWidget {
  final List<CollegeModel> colleges;

  const CustomTopColleges({super.key, required this.colleges});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Colleges for You',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                child: const Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1A73E8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Horizontal scroll
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: colleges.length,
            itemBuilder: (context, index) {
              return _CollegeCard(college: colleges[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _CollegeCard extends StatelessWidget {
  final CollegeModel college;

  const _CollegeCard({required this.college});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // College icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0FE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.account_balance_outlined,
              size: 20,
              color: Color(0xFF1A73E8),
            ),
          ),

          // College name
          Text(
            college.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 11, color: Color(0xFF888888)),
              const SizedBox(width: 2),
              Text(
                college.location,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF888888),
                ),
              ),
            ],
          ),

          // Rating
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 13, color: Color(0xFFFFC107)),
              const SizedBox(width: 3),
              Text(
                college.rating.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF444444),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  college.type,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color(0xFF1A73E8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
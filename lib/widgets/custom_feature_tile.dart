import 'package:flutter/material.dart';

class CustomFeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomFeatureTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: const Color(0xffF4F5F7),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 16,
            backgroundColor:
                Colors.blue,

            child: Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
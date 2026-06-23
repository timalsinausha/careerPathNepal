import 'package:flutter/material.dart';

class CustomSettingTile extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const CustomSettingTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: Colors.black87,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
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
    );
  }
}
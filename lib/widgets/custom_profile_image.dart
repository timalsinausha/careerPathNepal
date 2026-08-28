import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Stack(
          clipBehavior: Clip.none,
          children: [

            CircleAvatar(
              radius: 42,
              backgroundColor: Colors.grey.shade300,

              backgroundImage: const AssetImage(
                "assets/images/splash_screen.png",
              ),
            ),

            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 26,
                width: 26,

                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),

                child: const Icon(
                  Icons.edit,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
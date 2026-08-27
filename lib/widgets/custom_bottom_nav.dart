import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<BottomNavProvider>();

    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffE5E7EB),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [

          _navItem(
            context,
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: "Home",
            index: 0,
          ),

          _navItem(
            context,
            icon: Icons.quiz_outlined,
            activeIcon: Icons.quiz,
            label: "Assessment",
            index: 1,
          ),

          _navItem(
            context,
            icon: Icons.work_outline,
            activeIcon: Icons.work,
            label: "Results",
            index: 2,
          ),

          _navItem(
            context,
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: "Profile",
            index: 3,
          ),

          _navItem(
            context,
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: "Settings",
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final provider =
        context.watch<BottomNavProvider>();

    final isSelected =
        provider.currentIndex == index;

    return InkWell(
      onTap: () {
        provider.changeIndex(index);
      },

      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            Icon(
              isSelected
                  ? activeIcon
                  : icon,
              size: 25,
              color: isSelected
                  ? const Color(0xff274CFF)
                  : Colors.grey,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: isSelected
                    ? const Color(0xff274CFF)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
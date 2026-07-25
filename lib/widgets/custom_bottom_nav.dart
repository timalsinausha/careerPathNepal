import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavProvider>();

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xffE5E7EB),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(
            context,
            icon: Icons.home_outlined,
            index: 0,
          ),
          _navItem(
            context,
            icon: Icons.quiz_outlined,
            index: 1,
          ),
          _navItem(
            context,
            icon: Icons.school_outlined,
            index: 2,
          ),
          _navItem(
            context,
            icon: Icons.person_outline,
            index: 3,
          ),
          _navItem(
            context,
            icon: Icons.settings_outlined,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required int index,
  }) {
    final provider = context.watch<BottomNavProvider>();

    final isSelected =
        provider.currentIndex == index;

    return InkWell(
      onTap: () {
        provider.changeIndex(index);
      },
      child: Icon(
        icon,
        size: 28,
        color: isSelected
            ? const Color(0xff274CFF)
            : Colors.grey,
      ),
    );
  }
}
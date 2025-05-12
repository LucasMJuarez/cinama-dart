import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.label_outline),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}

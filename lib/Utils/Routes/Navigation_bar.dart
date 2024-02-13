import 'package:flutter/material.dart';

class NaviagtionBar extends StatelessWidget {
  final int selectedIndex;
  final List<NavigationDestination> destinations;
  final ValueChanged<int> onDestinationsSelected;
  const NaviagtionBar(
      {super.key,
      required this.selectedIndex,
      required this.destinations,
      required this.onDestinationsSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: destinations
          .map((destination) => BottomNavigationBarItem(
              icon: destination.icon, label: destination.label))
          .toList(),
      onTap: onDestinationsSelected,
    );
  }
}

class NavigationDestination {
  final Icon icon;
  final String label;
  NavigationDestination({required this.icon, required this.label});
}

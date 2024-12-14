import "package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart";
import 'package:flutter/material.dart';
import 'package:recipe_reach/screens/account_screen.dart';
import 'package:recipe_reach/screens/details_screen.dart';
import 'package:recipe_reach/screens/home_screen.dart';
import 'package:recipe_reach/screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    DetailsScreen(),
    HomeScreen(),
    AccountScreen(),
  ];

  final List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex], // Display the selected page
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Update index on tap
          });
          // Navigator.pushNamed(context, "/home");
        },
        backgroundColor: const Color.fromRGBO(4, 38, 40, 1),
        child: Image.asset(
          "assets/images/Chef.png",
          width: 24,
          height: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 66,
        child: AnimatedBottomNavigationBar(
          iconSize: 28,
          icons: iconList, // List of icons for tabs
          activeIndex: _selectedIndex,
          gapLocation: GapLocation.center, // Align gap with FAB

          notchSmoothness: NotchSmoothness.softEdge, // Smooth curve
          backgroundColor: Colors.white,
          activeColor: const Color.fromRGBO(132, 219, 223, 1),
          inactiveColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index; // Update index on tap
            });
          },
        ),
      ),
    );
  }
}

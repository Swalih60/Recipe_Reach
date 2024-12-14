import "package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_reach/providers/bottom_nav_provider.dart';
import 'package:recipe_reach/screens/account_screen.dart';
import 'package:recipe_reach/screens/home_screen.dart';
import 'package:recipe_reach/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(),
    const AccountScreen(),
  ];

  final List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomProvider>();
    return Scaffold(
      extendBody: true,
      body: _pages[provider.currentIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () {
          context.read<BottomProvider>().changeIndex(index: 2);
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
          icons: iconList,
          activeIndex: provider.currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          backgroundColor: Colors.white,
          activeColor: const Color.fromRGBO(132, 219, 223, 1),
          inactiveColor: Colors.black,
          onTap: (index) {
            context.read<BottomProvider>().changeIndex(index: index);
          },
        ),
      ),
    );
  }
}

import 'package:fastload/Screens/home/home.dart';
import 'package:fastload/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomePage(),
    Center(
      child: Text('Second screen'),
    ),
    Center(
      child: Text('Third screen'),
    ),
    Center(
      child: Text('Fourth screen'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens.elementAt(selectedIndex),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: selectedIndex,
          onTap: (i) {
            setState(() {
              selectedIndex = i;
            });
          },
          items: [
            SalomonBottomBarItem(
                icon: Icon(Iconsax.home),
                title: Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: Icon(Iconsax.wallet),
                title: Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: Icon(Iconsax.home),
                title: Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: Icon(Iconsax.home),
                title: Text('Home'),
                selectedColor: primaryColor)
          ],
        ));
  }
}

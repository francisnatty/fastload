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
    const HomePage(),
    const Center(
      child: Text('Second screen'),
    ),
    const Center(
      child: Text('Third screen'),
    ),
    const Center(
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
                icon: const Icon(Iconsax.home),
                title: const Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: const Icon(Iconsax.wallet),
                title: const Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: const Icon(Iconsax.home),
                title: const Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: const Icon(Iconsax.home),
                title: const Text('Home'),
                selectedColor: primaryColor)
          ],
        ));
  }
}

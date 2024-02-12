import 'package:fastload/Screens/Electricity/screens/eletricity.dart';
import 'package:fastload/Screens/home/home.dart';
import 'package:fastload/Screens/settings/settings.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/Screens/pin/pin_screen.dart';
import 'package:fastload/try.dart';

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
    // const HomePage(),
    const ElectricityPage(),
    const Try(),
    const Center(
      child: Text('Third screen'),
    ),
    const SettingsPage(),
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
                icon: const Icon(Iconsax.wallet4),
                title: const Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: const Icon(Iconsax.home),
                title: const Text('Home'),
                selectedColor: primaryColor),
            SalomonBottomBarItem(
                icon: const Icon(Iconsax.setting),
                title: const Text('Home'),
                selectedColor: primaryColor)
          ],
        ));
  }
}

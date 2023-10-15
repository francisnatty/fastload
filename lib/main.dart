import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/constants/variables.dart';
import 'package:fastload/global/global_functions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: fontName,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/Screens/registration/signin.dart';
import 'package:fastload/Screens/registration/signup.dart';
import 'package:fastload/constants/variables.dart';
import 'package:fastload/global/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const SignIn(),
    );
  }
}

import 'package:flutter/material.dart';

class PoorInternet extends StatefulWidget {
  const PoorInternet({super.key});

  @override
  State<PoorInternet> createState() => _PoorInternetState();
}

class _PoorInternetState extends State<PoorInternet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('error')),
    );
  }
}

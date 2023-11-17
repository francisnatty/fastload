import 'package:flutter/material.dart';

class GetMessages extends StatefulWidget {
  const GetMessages({super.key});

  @override
  State<GetMessages> createState() => _GetMessagesState();
}

class _GetMessagesState extends State<GetMessages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Natty'),
      ),
    );
  }
}

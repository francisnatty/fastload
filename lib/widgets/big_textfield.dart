import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';

class BigTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const BigTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white60,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryColor, width: 2))),
    );
  }
}

class BigPassTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const BigPassTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<BigPassTextField> createState() => _BigPassTextFieldState();
}

class _BigPassTextFieldState extends State<BigPassTextField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsecure = !obsecure;
                });
              },
              icon: obsecure
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility)),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white60,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryColor, width: 2))),
    );
  }
}

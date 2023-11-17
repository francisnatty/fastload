import 'package:fastload/constants/colors.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.30,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'FullName',
                fillColor: white),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
                controller: nameController,
                hintText: 'NickName  (optional)',
                fillColor: white),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.sizeOf(context).width,
                child: OutlinedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {},
                    child: const Text(
                      'NEXT',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ))),
          ],
        ),
      )),
    );
  }
}

import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Hello,Natty',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: Image.asset(Images.mtn).image,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'Your balance',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black87),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.black87,
                  )),
            ],
          ),
          const Text(
            '*****',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

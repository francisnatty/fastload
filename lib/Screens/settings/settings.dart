import 'package:fastload/Screens/settings/model/items.dart';
import 'package:fastload/Screens/settings/top_container.dart';
import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<ItemsModel> items = [
    ItemsModel(
        title: 'Link Card',
        leading: const Icon(
          Iconsax.card,
          color: primaryColor,
        ),
        substile: 'link your bank cards'),
    ItemsModel(
        title: 'Set Pin',
        leading: const Icon(
          Icons.pin,
          color: primaryColor,
        ),
        substile: 'Setup Pin/Change Pin '),
    ItemsModel(
        title: 'Security',
        leading: const Icon(
          Iconsax.security,
          color: primaryColor,
        ),
        substile: 'Setup acct/app security'),
    ItemsModel(
        title: 'Verification',
        leading: const Icon(
          Iconsax.verify,
          color: primaryColor,
        ),
        substile: 'Verification status'),
    ItemsModel(
        title: 'Support',
        leading: const Icon(
          Iconsax.support4,
          color: primaryColor,
        ),
        substile: 'Contact Customer care'),
    // ItemsModel(
    //     title: 'Rate Us',
    //     leading: Icon(
    //       Icons.rate_review_outlined,
    //       color: primaryColor,
    //     ),
    //     substile: 'Rate our app on playstore'),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              const TopContainer(),
              const SizedBox(
                height: 5,
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: white,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: items.map((e) {
                      return itemsListtile(e.title, e.leading, e.substile);
                    }).toList(),
                  )),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      foregroundColor: white,
                      backgroundColor: Colors.red.withOpacity(0.5)),
                  child: const Text('Logout'),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Text(
              //     'Logout',
              //     style: TextStyle(color: white, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Container itemsListtile(String title, Icon icon, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(3),
      // decoration: BoxDecoration(color: grey.withOpacity(0.4)
      // ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: icon,
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.arrow_right,
            color: primaryColor,
          ),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

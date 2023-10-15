import 'package:fastload/Screens/airtime/airtime.dart';
import 'package:fastload/Screens/home/transactions.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/constants/variables.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  String acctNumber = '6173624154';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: lightBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundImage: Image.asset(Images.userAvatar).image,
                      )),
                  SizedBox(
                    width: screenwidth * 0.03,
                  ),
                  const Text(
                    'Hello, Natty',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, fontFamily: fontName),
                  ),
                  const Spacer(),
                  const Icon(Iconsax.notification),
                ],
              ),
              SizedBox(
                height: screenheight * 0.02,
              ),
              Container(
                width: screenwidth,
                height: screenheight * 0.23,
                padding: const EdgeInsets.fromLTRB(15, 5, 10, 15),
                decoration: BoxDecoration(
                  color: lightBlack,
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(colors: [black, lightBlack, primaryColor]),
                ),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Your balance',
                              style: textStyle,
                            ),
                            IconButton(
                                onPressed: () {
                                  Utils().displayDialog(
                                      context,
                                      'Your purchase of N500 worth of airtime was sucessful',
                                      alertType.fail);
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible ? Iconsax.eye : Iconsax.eye_slash,
                                  color: white,
                                )),
                            const Spacer(),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircleAvatar(
                                backgroundImage:
                                    Image.asset(Images.naijaFlag).image,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenheight * 0.001,
                        ),
                        Text(
                          isVisible ? 'N300000000' : '*****',
                          style: balTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: white),
                              child: const Text('Add Money'),
                            ),
                            const Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ACCT NO',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      acctNumber,
                                      style: const TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await Clipboard.setData(
                                              ClipboardData(text: acctNumber));
                                          Utils.showSnackBar(context, 'Copied');
                                        },
                                        icon: const Icon(
                                          Iconsax.copy,
                                          size: 20,
                                          color: white,
                                        ))
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenwidth * 0.01,
              ),
              const Text(
                'Pay bills',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Divider(
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bills('Airtime', Icons.air, const AirtimePage()),
                  bills('Data', Icons.wifi, const AirtimePage()),
                  bills(
                      'Electricity', Icons.electric_bolt, const AirtimePage()),
                  bills('WAEC', Icons.cast_for_education, const AirtimePage()),
                  bills('Cable Tv', Icons.cast_connected, const AirtimePage()),
                ],
              ),
              const Divider(
                color: primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: ListTile(
                  // mouseCursor: Colors.grey,

                  tileColor: Colors.grey.withOpacity(0.2),
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.6)),
                      child: const Icon(
                        Iconsax.people,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  title: const Text(
                    'Refer and Earn',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      const Text('Refer your friends and earn cash prices'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Transactions()
            ],
          ),
        ),
      ),
    );
  }

  Column bills(String title, IconData icon, Widget newScreen) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.black87, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              Utils.Navigate(context, newScreen);
            },
            icon: Icon(
              icon,
              color: white,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

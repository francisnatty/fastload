import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';

class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  List<int> prices = [
    50,
    100,
    200,
    500,
    1000,
    2000,
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.2,
      width: screenWidth,
      decoration: BoxDecoration(
          // gradient: RadialGradient(
          //     tileMode: TileMode.mirror,
          //     radius: 0.3,
          //     colors: [primaryColor, black]),
          // color: Colors.black87,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          // const Divider(
          //   color: primaryColor,
          // ),
          // Text(
          //   'Choose Amount',
          //   style: TextStyle(color: black, fontWeight: FontWeight.w700),
          // ),
          // const Divider(
          //   color: primaryColor,
          // ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: prices.map((e) {
              return priceDesign(e, screenHeight, screenWidth);
            }).toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Container priceDesign(int price, double height, double width) {
    return Container(
      height: height * 0.07,
      width: width / 5,
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: primaryColor, blurRadius: 2, offset: Offset(2, 4)),
          ]),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'N${price.toString()}',
          style: const TextStyle(color: white, fontWeight: FontWeight.bold),
        )
      ])),
    );
  }
}

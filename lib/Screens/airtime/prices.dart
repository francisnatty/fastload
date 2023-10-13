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
      height: screenHeight * 0.5,
      width: screenWidth,
      decoration: BoxDecoration(color: Colors.black87),
      child: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: prices.map((e) {
            return priceDesign(e, screenHeight, screenWidth);
          }).toList(),
        ),
      ),
    );
  }

  Container priceDesign(int price, double height, double width) {
    return Container(
      height: height * 0.15,
      width: width / 4,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'N${price.toString()}',
          style: TextStyle(color: white),
        )
      ])),
    );
  }
}

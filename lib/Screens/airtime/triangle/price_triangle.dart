import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TriangleEdgeContainer extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final Color containerColor;
  final double triangleSize;
  final Color triangleColor;
  final String? title;

  TriangleEdgeContainer(
      {this.containerWidth = 200.0,
      this.containerHeight = 200.0,
      this.containerColor = Colors.blue,
      this.triangleSize = 20.0,
      this.triangleColor = Colors.red,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: triangleSize,
                height: triangleSize,
                color: triangleColor,
              ),
            ),
          ),
          Text(title!),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Triangle Edge Container'),
        ),
        body: Center(
          child: TriangleEdgeContainer(),
        ),
      ),
    );
  }
}

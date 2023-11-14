import 'package:fastload/cubit/BankAccount/bank_repo.dart';
import 'package:flutter/material.dart';

class PaintApp extends StatefulWidget {
  const PaintApp({super.key});

  @override
  State<PaintApp> createState() => _PaintAppState();
}

class _PaintAppState extends State<PaintApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BankRepository().requestBankAcct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              height: 200,
              width: 200,
              child: CustomPaint(
                painter: MyPainter(),
              ))),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    var linePaint = Paint();
    linePaint.color = Colors.green;
    linePaint.strokeWidth = 20;
    // linePaint.strokeCap = 10.0;

    canvas.drawCircle(
        Offset(size.height / 2, size.width / 2), size.width / 2, paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width * 0.7, size.height / 2), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

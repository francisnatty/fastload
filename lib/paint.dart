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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomPaint(
                painter: Pentagon(),
                size: Size(MediaQuery.sizeOf(context).width / 5,
                    MediaQuery.sizeOf(context).height / 5),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClipPath(
                clipper: PentagoClip(),
                child: Container(
                    color: Colors.green,
                    width: MediaQuery.sizeOf(context).width / 5,
                    height: MediaQuery.sizeOf(context).height / 5),
              ),
            )
          ],
        ));
  }
}

class PentagoClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var paint = Paint()..color = Colors.blue;

    //  path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    // path.lineTo(size.width, size.height * 0.4);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Pentagon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()..color = Colors.blue;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width * 0.5, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

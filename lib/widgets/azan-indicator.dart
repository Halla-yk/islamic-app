import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  final strokeCircle = 13.0;
  double currentProgress;
  double duration;

  CircleProgress(this.currentProgress, this.duration);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = Colors.black12
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 70;
    canvas.drawCircle(center, radius, circle);

    //animated Arc
    Paint animatedArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double angle = 2 * pi * (currentProgress / duration);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animatedArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class AzanIndicator extends StatefulWidget {
  final double diffTime;
  final double pastTime;
  final String prayer;
  final String date;

  AzanIndicator(
      {required this.diffTime,
      required this.pastTime,
      required this.prayer,
      required this.date});

  @override
  _AzanIndicatorState createState() => _AzanIndicatorState();
}

class _AzanIndicatorState extends State<AzanIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final maxProgress = 100.0;
  String remainingTime = "";
  @override
  void initState() {
    super.initState();
    double remainingInSecond = widget.diffTime * 3600.0;

    print(widget.pastTime);
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 3000));
    _animation = Tween<double>(begin: widget.pastTime, end: widget.diffTime)
        .animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
     var x = _animation.value;
    var hour = x.toString().split('.')[0]. substring(0,1);
    var minute = x.toString().split('.')[1]. substring(0,2);
    remainingTime =  "${hour}:${minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
            foregroundPainter:
                CircleProgress(_animation.value, widget.diffTime),
            child: Center(
              child: Container(
                color: Color(0xffe6f0ff),
                width: double.infinity,
                height: 200,
                child: GestureDetector(
                  onTap: (){
                    _animationController.forward();
                  },
                  child: Center(
                    child: Text(remainingTime),
                    // Text('data'),Text('data')
                  ),
                ),
              ),
            )),
        Container(
            width: double.infinity,
            color: Color(0xff46b4db),
            child: Column(
              children: [Text(widget.prayer),SizedBox(height: 10,), Text(widget.date)],
            ))
      ],
    );
  }
}

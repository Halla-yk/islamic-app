import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
class AzanTimer extends StatefulWidget {
  final double diffTime;
  final double pastTime;
  final String prayer;
  final String date;

  AzanTimer(
      {required this.diffTime,
        required this.pastTime,
        required this.prayer,
        required this.date});

  @override
  _AzanTimerState createState() => _AzanTimerState();
}

class _AzanTimerState extends State<AzanTimer> {

  CountDownController _controller = CountDownController();


  @override
  Widget build(BuildContext context) {
    double remainingInSecond = widget.diffTime * 3600;
    double pastTimeInSecond = widget.pastTime * 3600;
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 1.8,
      color: Color(0xff79BCD7),
      child: Column(
        children: [
          SizedBox(height: 20,),

          Center(
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.width/3,
                initialDuration: pastTimeInSecond.toInt(),
                duration: remainingInSecond.toInt(),
                ringColor: Colors.black12,
                fillColor: Colors.amberAccent,
                controller: _controller,
                strokeWidth:  MediaQuery.of(context).size.width/20,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverse: true,
                textStyle: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.prayer,style: TextStyle(color: Colors.white,fontSize: 12),),
                SizedBox(width: 5,)
                ,Text(widget.date,style: TextStyle(color: Colors.white,fontSize: 12),)
              ],
            ),
          )
        ],
      ),
    );
  }
}


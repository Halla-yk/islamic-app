import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/widgets/azan-indicator.dart';
import 'home.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // // to switch after delayed time
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //  Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
    // });
    return Scaffold(
    body:  new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Image.asset("assets/images/splash.jpg", fit: BoxFit.fitHeight)
            ]
        )
    )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:islamic_app/functions.dart';
import 'package:islamic_app/services/api.dart';
import 'package:islamic_app/view-models/api-view-model.dart';
import 'package:islamic_app/widgets/NavigationDrawer.dart';
import 'package:islamic_app/widgets/azan-indicator.dart';
import 'package:islamic_app/widgets/prayer-time-tile.dart';
import 'alarm.dart';

class Home extends StatefulWidget {
  static String route = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final ApiViewModel _apiViewModel= ApiViewModel();
   final JsonConnection _jsonConnection = JsonConnection();
  TimeOfDay nowTime = TimeOfDay.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: _jsonConnection.getPrayerTimeByLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            late double diffTime;
            late double pastTime;
            late String prayer;
            print(nowTime);
            if (!compareTime(
                    stringToTime(snapshot.data.data.timings.fajr), nowTime) &&
                compareTime(
                    stringToTime(snapshot.data.data.timings.dhuhr), nowTime)) {
              diffTime = calcDiffTime(stringToTime(snapshot.data.data.timings.dhuhr),stringToTime(snapshot.data.data.timings.fajr));
              pastTime =  calcDiffTime(nowTime,stringToTime(snapshot.data.data.timings.fajr));
              prayer = 'Dhuhr';
            }else if (!compareTime(
                stringToTime(snapshot.data.data.timings.dhuhr), nowTime) &&
                compareTime(
                    stringToTime(snapshot.data.data.timings.asr), nowTime)) {
              diffTime = calcDiffTime(stringToTime(snapshot.data.data.timings.asr),stringToTime(snapshot.data.data.timings.dhuhr));
              pastTime =  calcDiffTime(nowTime,stringToTime(snapshot.data.data.timings.dhuhr));
              prayer = 'Asr';
            }else if (!compareTime(
                stringToTime(snapshot.data.data.timings.asr), nowTime) &&
                compareTime(
                    stringToTime(snapshot.data.data.timings.maghrib), nowTime)) {
              diffTime = calcDiffTime(stringToTime(snapshot.data.data.timings.maghrib), stringToTime(snapshot.data.data.timings.asr));
              pastTime =  calcDiffTime(nowTime,stringToTime(snapshot.data.data.timings.asr));
              prayer = 'maghrib';
            }else if (!compareTime(
                stringToTime(snapshot.data.data.timings.maghrib), nowTime) &&
                compareTime(
                    stringToTime(snapshot.data.data.timings.isha), nowTime)) {
              diffTime = calcDiffTime(stringToTime(snapshot.data.data.timings.isha), stringToTime(snapshot.data.data.timings.maghrib));
              pastTime =  calcDiffTime(nowTime,stringToTime(snapshot.data.data.timings.maghrib));
              prayer = 'Aisha';
            }else if (!compareTime(
                stringToTime(snapshot.data.data.timings.isha), nowTime) &&
                compareTime(
                    stringToTime(snapshot.data.data.timings.fajr), nowTime)) {
              diffTime = calcDiffTime(stringToTime(snapshot.data.data.timings.fajr), nowTime);
              prayer = 'Fajer';
            }
            return
              Column(
                children: [
                  Container(
                    child: AzanTimer(
                      diffTime: diffTime,
                      pastTime: pastTime,
                      date: snapshot.data.data.date.hijri.date,
                      prayer: prayer,
                    ),
            ),
                  PrayerTimeTile(prayer: 'Fajr', timing: snapshot.data.data.timings.fajr),
                  PrayerTimeTile(prayer: 'Dhuhr', timing: snapshot.data.data.timings.dhuhr),
                  PrayerTimeTile(prayer: 'Asr', timing: snapshot.data.data.timings.asr),
                  PrayerTimeTile(prayer: 'Maghrib', timing: snapshot.data.data.timings.maghrib),
                  PrayerTimeTile(prayer: 'Isha', timing: snapshot.data.data.timings.isha),
                ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      appBar: AppBar(elevation: 0,backgroundColor: Color(0xff79BCD7),),
      drawer: NavigationDrawer(),
    );
  }
}

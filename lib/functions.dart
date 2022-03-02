import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
bool compareTime(TimeOfDay prayer, TimeOfDay current) {

  double _timeDiff = calcDiffTime(prayer,current);
  if (_timeDiff > 0) {
    return true;
  } else {
    return false;
  }
}

TimeOfDay stringToTime(String prayerTime) {
  final format = DateFormat.Hm();
  return TimeOfDay.fromDateTime(format.parse(prayerTime));
}
double calcDiffTime(TimeOfDay prayer2, TimeOfDay prayer1){
  double _doublePrayer2 =
      prayer2.hour.toDouble() + (prayer2.minute.toDouble() / 60);
  double _doublePrayer1 =
      prayer1.hour.toDouble() + (prayer1.minute.toDouble() / 60);

  var _timeDiff = _doublePrayer2 - _doublePrayer1;
  return _timeDiff;

}

specifyThePrayer(){


}
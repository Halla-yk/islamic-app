import 'package:flutter/cupertino.dart';
import 'package:islamic_app/models/json.dart';
import 'package:islamic_app/services/api.dart';
class ApiViewModel{
  late Data _data ;

   fetchData() async{
    _data = await JsonConnection().getPrayerTimeByLocation();
}
   Future<Data> get getData async{
    return  _data;
}
}
//اذا البيانات بتتغير باستمرار مممكن اخليها ك provider
//واعمل ل method getData -> notifyListeners
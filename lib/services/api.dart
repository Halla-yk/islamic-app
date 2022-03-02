import 'dart:convert';
import 'package:islamic_app/models/json.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class JsonConnection {
  late Data data;

  static double pLat = 0;
  static double pLong = 0;

  Future<Data> getPrayerTimeByLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();

      pLat = position.latitude;
      pLong = position.longitude;

      String date = DateTime.now().toIso8601String();
      int method = 4;
      http.Response response = await http.get(Uri.parse(
          "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method"));
     // if(response.statusCode == 200){
      final json = jsonDecode(response.body); //من داتا ل json
      data = new Data.fromJson(json); //من json ل object
      return data;
      // }
      // else{
      //   print('');
      // }
    }catch(error){
     throw error;
    }


  }
}

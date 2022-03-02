import 'package:flutter/material.dart';

class PrayerTimeTile extends StatelessWidget {
  final String prayer;
  final String timing;

  PrayerTimeTile({required this.prayer, required this.timing});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 7,
      margin: EdgeInsets.all( MediaQuery.of(context).size.width/50),
      child: ListTile(
        leading: Text(this.prayer,style: TextStyle(fontSize: 15),),
        trailing: Text(this.timing,style: TextStyle(color: Colors.black38),)
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [Text(this.prayer,style: TextStyle(fontSize: 20),), Text(this.timing,style: TextStyle(color: Colors.black38),)],
      // ),
    );
  }
}

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [Container(child: Image.asset("assets/images/islamicDesign.jpg")),buildMenuTile(text: 'Azkar', icon: Icons.book_outlined)],
        ),
      ),
    );
  }

  buildMenuTile({required String text, required IconData icon}) {
    return ListTile(
      hoverColor: Colors.white24,
        leading: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(icon)
    ,onTap: (){},
    );
  }
}

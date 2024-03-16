import 'package:flutter/material.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/profile.dart';
import 'package:major_project/viewBus.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          child: Container(
            height: 100,
            width: double.infinity,
            color: Color.fromARGB(255, 1, 200, 255),
            child: Center(
              child: Text(
                "Bus Tracking",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:15),
          child: Column(
            children: [
              drawerItem(context, Icons.person_2_rounded, 'Profile', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              }),
              SizedBox(height: 25),
              drawerItem(context, Icons.bookmark, 'Saved Routes', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              }),
        
              SizedBox(height: 25),
              drawerItem(context, Icons.remove_red_eye, 'View Bus', () { 
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewBus(),
                ));
              }),
        
              SizedBox(height: 25),
              drawerItem(context, Icons.help_center, 'Help', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              }),
              SizedBox(height: 240),
              drawerItem(context, Icons.exit_to_app, 'Logout', () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoadingPage(),
                ));
              }),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget drawerItem(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
  return Row(
    children: [
      Icon(icon),
      TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 2, 5, 7)),
        ),
      ),
    ],
  );
}

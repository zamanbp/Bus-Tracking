import 'package:flutter/material.dart';
import 'package:major_project/presentation/busRoutePage.dart';
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/model/getRoutemodel.dart';
import 'package:major_project/presentation/profile.dart';
import 'package:major_project/presentation/savedRoutePage.dart';
import 'package:major_project/services/addnotificationApi.dart';
import 'package:major_project/services/getAllBusDetails.dart';
import 'package:major_project/services/getBusRoutes.dart';
import 'package:major_project/services/viewsavedRoute.dart';
import 'package:major_project/presentation/viewBus.dart';
import 'package:major_project/presentation/viewallBus.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          child: Container(
            height: 100,
            width: 350,
            color: Color.fromARGB(255, 3, 28, 104),
            child: Center(
              child: Text(
                "Bus Tracking",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
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
              drawerItem(context, Icons.route, 'View Routes', () async{  
                //final routes = await getRouteName();
                busRouteNav(context);
              }),
              SizedBox(height: 25),
              drawerItem(context, Icons.bookmark, 'Saved Routes', () async{
                final routes = await viewsavedRouteApi(loginId.toString());
                savedRoutes = routes;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => 
                  SavedBusRoutePage(routes: routes,),
                ));
              }),
        
              SizedBox(height: 25),
              drawerItem(context, Icons.remove_red_eye, 'View Bus', () async{ 
                final res = await getAllBus();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewAllBus(busdetails: res!),
                ));
              }),
        
              SizedBox(height: 25),
              drawerItem(context, Icons.help_center, 'Help', () async{
               // await addNotification("1", "kl");
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Profile(),
                // ));
              }),
              SizedBox(height: 150),
              drawerItem(context, Icons.exit_to_app, 'Sign out', () {
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

busRouteNav(BuildContext context) async{
  final routes = await getRouteName();
  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BusRoutePage(routes: routes!),
                ));
}
import 'package:flutter/material.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/profile.dart';

class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.amber,
              child: Center(
                  child: Text(
                "Bus Tracking",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )),
            )),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person_2_rounded),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                      },
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 2, 5, 7)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(Icons.saved_search_outlined),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                      },
                      child: Text(
                        'Saved Routes',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 2, 5, 7)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(Icons.help_center),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Profile(),
                        ));
                      },
                      child: Text(
                        'Help',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 2, 5, 7)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
                Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoadingPage(),
                        ));
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 2, 5, 7)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.location_pin),
                border: OutlineInputBorder(),
                hintText: "Current location",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Destination"),
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Buss Tracking'),
      ),
    );
  }
}

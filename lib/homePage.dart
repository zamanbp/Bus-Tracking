import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/busListPage.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/profile.dart';
import 'package:major_project/signupPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      floatingActionButtonLocation: CustomFABLocation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.location_searching),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset('assets/images/map.png')),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 234, 236, 230),
              ),
              height: 230,
              width: 320,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: CupertinoTextField(
                      placeholder: 'Current location',
                      suffix: Icon(Icons.location_pin),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 56, 51, 51)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: CupertinoTextField(
                      placeholder: 'Destination',
                      suffix: Icon(Icons.location_pin),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 56, 51, 51)),
                      ),
                    ),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 1, 200, 255),
                      minimumSize: Size(280, 50), // Set the width and height as per your requirement
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusListPage(),));
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Profile(),
                      ));
                    },
                    child: Text('Search with Bus name ?')),
                ],
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Bus Tracking'),
      ),
    );
  }
}

class CustomFABLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the values based on your desired positioning
    return Offset(scaffoldGeometry.scaffoldSize.width - 70, scaffoldGeometry.scaffoldSize.height - 270);
  }
}

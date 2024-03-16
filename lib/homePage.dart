import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/busListPage.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/model/busByStopsModel.dart';
import 'package:major_project/profile.dart';
import 'package:major_project/services/getAllBusDetails.dart';
import 'package:major_project/services/getBusWithStops.dart';
import 'package:major_project/services/getBusstopbyrouteId.dart';
import 'package:major_project/signupPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController starting = TextEditingController();
  TextEditingController endingg = TextEditingController();
  ValueNotifier<bool> isClicked = ValueNotifier(false);

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
            child: 
            ValueListenableBuilder(
              valueListenable: isClicked
            , builder: (context, value, child) {
              return 
              isClicked.value? Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 234, 236, 230),
              ),
              height: 180,
              width: 320,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                      child: CupertinoTextField(
                            controller: starting,
                            placeholder: 'Bus Name',
                            suffix: Icon(Icons.search),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 56, 51, 51)),
                            ),
                          ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 1, 200, 255),
                      minimumSize: Size(280, 50), // Set the width and height as per your requirement
                    ),
                    onPressed: () async{
                      final responce = await getBuses();
                      //getBusStopwithRouteid();                      
                      //getAllBus();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusListPage(busList: responce ,),));
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
                      isClicked.value = false;
                    },
                    child: Text('Search with Source and Destination ?')),
                  ],
                ),
              ) :



              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Color.fromARGB(255, 234, 236, 230),
              ),
              height: 230,
              width: 320,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 25, right: 25),
                    child: CupertinoTextField(
                      controller: starting,
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
                      controller: endingg,
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
                    onPressed: () async{
                      final responce = await getBuses();
                      //getBusStopwithRouteid();                      
                      //getAllBus();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BusListPage(busList: responce ,),));
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
                      isClicked.value = true;
                    },
                    child: Text('Search with Bus name ?')),
                ],
              ),
            );
            },)
            
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Bus Tracking'),
      ),
    );
  }
  Future<List<BusByStops>?> getBuses() async{
    final datas = await getBusWithStops(starting.text,endingg.text);
    if (datas != null) {
      if (datas.length>0) {
        return datas;
      }
      else{
        return null;
      }
    }
    else{
      return null;
    }
  }
}

class CustomFABLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the values based on your desired positioning
    return Offset(scaffoldGeometry.scaffoldSize.width - 70, scaffoldGeometry.scaffoldSize.height - 270);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/busRoute.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/liveBus.dart';
import 'package:major_project/loadingPage.dart';
import 'package:major_project/model/busByStopsModel.dart';
import 'package:major_project/profile.dart';

import 'model/busList.dart';

class BusListPage extends StatelessWidget {
  final List<BusByStops>? busList;
  String? status;
  BusListPage({super.key,this.busList, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buss Tracking'),
      ),
      drawer: buildDrawer(context),
      body: 
      busList == null? Center(child: Text("Sorry no buses found"),):
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            height: 200,
            width: 320,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
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
                
                SizedBox(height: 20,),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Color.fromARGB(255, 1, 200, 255),
                //     minimumSize: Size(280,
                //         50), // Set the width and height as per your requirement
                //   ),
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => BusListPage(),
                //     ));
                //   },
                //   child: Text(
                //     "Search",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = busList![index];
                    String busname = item.busname;
                    String busNumber = item.regnum;
                    String busRoute = "${item.source} - ${item.destination}";
                    // String startingTime = busList[index]['Staring Time'];
                    // String destinationTime = busList[index]['Destination Time'];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Card(
                          child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => BusRoute(
                                //       busName: busname,
                                //       busNumber: busNumber,
                                //       stratingTime: startingTime,
                                //       destinationTime: destinationTime
                                //       ),
                                // ));
                              },
                              title: Text(busname),
                              trailing: Text(busNumber),
                              subtitle: Text(busRoute),
                              leading: Icon(Icons.directions_bus),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Text(startingTime),
                                // Text(destinationTime),
                              ],
                            ),
                            Divider(),
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => LiveBus(
                                                busName: busname,
                                                stratingTime: busRoute,
                                                busNumber: busNumber)));
                                  },
                                  icon: Icon(Icons.location_searching_outlined),
                                  label: Text("Live Location"),
                                ))
                          ],
                        ),
                      )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 3);
                  },
                  itemCount: busList!.length))
        ],
      ),
    );
  }
}

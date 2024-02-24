import 'package:flutter/material.dart';

import 'dartdrawer_utils.dart';

class LiveBus extends StatelessWidget {
  const LiveBus({super.key, required this.busName, required this.stratingTime, required this.busNumber});
  final String busName;
  final String stratingTime;
  //final String destinationTime;
  final String busNumber;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Buss Tracking'),
      ),
      drawer: buildDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 30),
            child: Card(
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(busName),
                      trailing: Text(busNumber),
                      subtitle: Text(stratingTime),
                      leading: Icon(Icons.directions_bus),
                    ),
                    Divider(),
                    Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.location_searching_outlined),
                          label: Text("Live Location"),
                        )),

                        
                  ],
                ),
              ),
            ),
          ),

    ]));}}
    
  

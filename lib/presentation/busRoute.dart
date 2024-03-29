import 'dart:async';

import 'package:flutter/material.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/model/commonList.dart';
import 'package:major_project/widgets/progressBar.dart';
import 'package:major_project/services/getbuscurrentlocation.dart';

class BusRoute extends StatefulWidget {
  String? busid;
  String? busName;
  String? stratingTime;
  final String? destinationTime;
  final String? busNumber;

  BusRoute({super.key, this.busName, required this.stratingTime, this.busNumber, this.destinationTime,this.busid});

  @override
  State<BusRoute> createState() => _BusRouteState();
}

class _BusRouteState extends State<BusRoute> {

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 10), (Timer t)  {
      //activeCheck();
      initFunc(widget.busid!, widget.busNumber!);
    });  
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var mediaquery=MediaQuery.of(context).size;
    return Scaffold(
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
                    if(widget.busName != null)
                    ListTile(
                      title: Text(widget.busName!),
                      trailing: Text(widget.busNumber!),
                      subtitle: Text(widget.stratingTime!),
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
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: MilestoneProgress(height: 800,totalMilestones: stops.length,completedMilestone: bustracking[bustracking.length-1].order,milestoneLabels:stops,),
          )
        ],
      ),
    );
  }

  initFunc(String busid,String busno) async{
    //bustracking.clear();
    bustracking = await getBusLocation(busid,busno);
    print(bustracking.length);
    print("OEDER STOP : ${bustracking[bustracking.length-1].order}");
    print("STOP ID : ${bustracking[bustracking.length-1].busstop}");
    setState(() {
    });
  }
}

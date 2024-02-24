import 'package:flutter/material.dart';
import 'package:major_project/dartdrawer_utils.dart';
import 'package:major_project/progressBar.dart';

class BusRoute extends StatelessWidget {
  final String busName;
  final String stratingTime;
  final String destinationTime;
  final String busNumber;

  BusRoute({super.key, required this.busName, required this.stratingTime, required this.busNumber, required this.destinationTime});

  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size;
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
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: MilestoneProgress(height: 500,totalMilestones: 5,completedMilestone: 1,milestoneLabels: ['b','a','c','d','d'],),
          )
        ],
      ),
    );
  }
}

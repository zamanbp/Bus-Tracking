import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'busRoute.dart';
import 'liveBus.dart';
import 'model/busList.dart';

class ViewBus extends StatelessWidget {
  const ViewBus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CupertinoTextField(
            placeholder: 'Search Bus',
            // suffix: Icon(Icons.location_pin),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 56, 51, 51)),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                String busname = busList[index]['Bus Name'];
                String busNumber = busList[index]['Bus Number'];
                String busRoute = busList[index]['Bus Route'];
                String startingTime = busList[index]['Staring Time'];
                String destinationTime = busList[index]['Destination Time'];

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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BusRoute(
                                  busName: busname,
                                  busNumber: busNumber,
                                  stratingTime: startingTime,
                                  destinationTime: destinationTime),
                            ));
                          },
                          title: Text(busname),
                          trailing: Text(busNumber),
                          subtitle: Text(busRoute),
                          leading: Icon(Icons.directions_bus),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(startingTime),
                            Text(destinationTime),
                          ],
                        ),
                        Divider(),
                        Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
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
              itemCount: busList.length),
        )
      ],
    ));
  }
}

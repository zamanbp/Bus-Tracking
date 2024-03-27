import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/model/getAllBusModel.dart';
import 'busRoute.dart';
import 'liveBus.dart';

class ViewAllBus extends StatelessWidget {
  final List<GetAllBusModel> busdetails;
   ViewAllBus({super.key, required this.busdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buses"),),
        body: Column(
      children: [
       // SizedBox(height: 20,),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                 final bus = busdetails[index];
                String busname = bus.busname;
                String busNumber = bus.regnum;
                String busRoute = bus.routeid.toString();
                String startingTime = bus.source;
                String destinationTime = bus.destination;

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
              itemCount: busdetails.length),
        )
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/getBusesbyrouteId.dart';
import 'package:major_project/model/getRoutemodel.dart';
import 'package:major_project/services/saveRoute.dart';
import 'package:major_project/viewBus.dart';

class BusRoutePage extends StatelessWidget {
  final List<BusRoutes>? routes;
  const BusRoutePage({Key? key, this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final route = routes![index];
          return InkWell(
            onTap: () async{
              final buses = await getBusByRouteId(route.routeid.toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBus(busdetails: buses!, start: route.source, end: route.destination),));
            },
            child: Card(
              child: IntrinsicWidth(
                child: ListTile(
                  leading: Icon(Icons.bus_alert),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Starting: ${route.source}"),
                      SizedBox(height: 5),
                      Text("Ending: ${route.destination}"),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () async{
                      final resp = await saveRouteApi(route.routeid.toString(), route.destination, route.source, loginId!.toString());
                      if (resp == "success") {
                         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Route saved successfully"),
          ),
        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Error while saving route"),
          ),
        );
                      }
                    },
                    icon: Icon(Icons.save, color: Colors.black38),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: routes!.length,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/services/getBusesbyrouteId.dart';
import 'package:major_project/model/savedBusModel.dart';
import 'package:major_project/presentation/viewBus.dart';
import 'package:major_project/services/removeSavedRoute.dart';
import 'package:major_project/services/viewsavedRoute.dart';

class SavedBusRoutePage extends StatefulWidget {
  final List<SavedBusModel>? routes;
  const SavedBusRoutePage({Key? key, this.routes}) : super(key: key);

  @override
  State<SavedBusRoutePage> createState() => _SavedBusRoutePageState();
}

class _SavedBusRoutePageState extends State<SavedBusRoutePage> {
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final route = savedRoutes[index];
          return InkWell(
            onTap: () async{
              final buses = await getBusByRouteId(route.routeid.toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBus(busdetails: buses!, start: route.starting, end: route.starting),));
            },
            child: Card(
              child: IntrinsicWidth(
                child: ListTile(
                  leading: Icon(Icons.bus_alert),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Starting: ${route.starting}"),
                      SizedBox(height: 5),
                      Text("Ending: ${route.ending}"),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () async{
                      final status = await deleteRouteApi(route.routeid.toString());
                      if (status == "success") {
                        final routes = await viewsavedRouteApi(loginId.toString());
                        savedRoutes = routes;
                        setState(() {
                          
                        });
                       //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBus(busdetails: busdetails, start: route.starting, end: route.ending),))
                      }
                    },
                    icon: Icon(Icons.delete, color: Colors.black38),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: widget.routes!.length,
      ),
    );
  }
}

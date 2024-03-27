
import 'package:meta/meta.dart';
import 'dart:convert';

GetAllBusModel GetAllBusModelFromJson(String str) => GetAllBusModel.fromJson(json.decode(str));

String GetAllBusModelToJson(GetAllBusModel data) => json.encode(data.toJson());

class GetAllBusModel {
    int busid;
    String busname;
    String destination;
    String ownername;
    int ownerphone;
    String regnum;
    int routeid;
    String source;

    GetAllBusModel({
        required this.busid,
        required this.busname,
        required this.destination,
        required this.ownername,
        required this.ownerphone,
        required this.regnum,
        required this.routeid,
        required this.source,
    });

    factory GetAllBusModel.fromJson(Map<String, dynamic> json) => GetAllBusModel(
        busid: json["busid"],
        busname: json["busname"],
        destination: json["destination"],
        ownername: json["ownername"],
        ownerphone: json["ownerphone"],
        regnum: json["regnum"],
        routeid: json["routeid"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "busid": busid,
        "busname": busname,
        "destination": destination,
        "ownername": ownername,
        "ownerphone": ownerphone,
        "regnum": regnum,
        "routeid": routeid,
        "source": source,
    };
}

// To parse this JSON data, do
//
//     final BusByStops = BusByStopsFromJson(jsonString);

import 'dart:convert';

BusByStops BusByStopsFromJson(String str) => BusByStops.fromJson(json.decode(str));

String BusByStopsToJson(BusByStops data) => json.encode(data.toJson());

class BusByStops {
    int busid;
    String busname;
    String destination;
    String ownername;
    int ownerphone;
    String regnum;
    int routeid;
    String source;

    BusByStops({
        required this.busid,
        required this.busname,
        required this.destination,
        required this.ownername,
        required this.ownerphone,
        required this.regnum,
        required this.routeid,
        required this.source,
    });

    factory BusByStops.fromJson(Map<String, dynamic> json) => BusByStops(
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

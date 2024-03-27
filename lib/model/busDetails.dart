// To parse this JSON data, do
//
//     final BusDetailsModel = BusDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusDetailsModel BusDetailsModelFromJson(String str) => BusDetailsModel.fromJson(json.decode(str));

String BusDetailsModelToJson(BusDetailsModel data) => json.encode(data.toJson());

class BusDetailsModel {
    int busid;
    String busname;
    String ownername;
    int ownerphone;
    String regnum;
    int routeid;

    BusDetailsModel({
        required this.busid,
        required this.busname,
        required this.ownername,
        required this.ownerphone,
        required this.regnum,
        required this.routeid,
    });

    factory BusDetailsModel.fromJson(Map<String, dynamic> json) => BusDetailsModel(
        busid: json["busid"],
        busname: json["busname"],
        ownername: json["ownername"],
        ownerphone: json["ownerphone"],
        regnum: json["regnum"],
        routeid: json["routeid"],
    );

    Map<String, dynamic> toJson() => {
        "busid": busid,
        "busname": busname,
        "ownername": ownername,
        "ownerphone": ownerphone,
        "regnum": regnum,
        "routeid": routeid,
    };
}

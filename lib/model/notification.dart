// To parse this JSON data, do
//
//     final NotificationModel = NotificationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotificationModel NotificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String NotificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    int busid;
    String busname;
    String busregno;
    int curentstopid;
    String currentstop;
    String lattitude;
    String longitude;
    int nid;
    String notifystopid;
    int userlogid;

    NotificationModel({
        required this.busid,
        required this.busname,
        required this.busregno,
        required this.curentstopid,
        required this.currentstop,
        required this.lattitude,
        required this.longitude,
        required this.nid,
        required this.notifystopid,
        required this.userlogid,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        busid: json["busid"],
        busname: json["busname"],
        busregno: json["busregno"],
        curentstopid: json["curentstopid"],
        currentstop: json["currentstop"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
        nid: json["nid"],
        notifystopid: json["notifystopid"],
        userlogid: json["userlogid"],
    );

    Map<String, dynamic> toJson() => {
        "busid": busid,
        "busname": busname,
        "busregno": busregno,
        "curentstopid": curentstopid,
        "currentstop": currentstop,
        "lattitude": lattitude,
        "longitude": longitude,
        "nid": nid,
        "notifystopid": notifystopid,
        "userlogid": userlogid,
    };
}

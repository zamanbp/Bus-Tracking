import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/busBylocaatinAndStops.dart';
import 'package:major_project/model/commonList.dart';

Future<bool> addNotification(String busid,String reg,String stopid,String name) async{
  //bustracking.clear();
  final uri = Uri.parse("$baseUrl/insert_nnotification?stopid=$stopid&userid=$loginId&busid=$busid&busregno=$reg&busname=$name");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print("location : ${responce.body}");

  try {
    if (responce.statusCode == 200) {
      print("success");
      final res = jsonDecode(responce.body);
      //final reply = (res as List).map((e) => BusStopsAndLocation.fromJson(e)).toList();
      //print("rply $reply");
      return true;
    }
    else{
      print("Else ");
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
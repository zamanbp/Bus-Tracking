import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/commonList.dart';
import 'package:major_project/model/stopOrderModel.dart';


Future<List<StopOrderRouteModel>> getStopsByRoute(String id) async{
  final uri = Uri.parse("$baseUrl/stoporderbyroteid?route_id=$id");
  final responce = await http.get(uri);
  // print(responce.statusCode);
  // print("stoporder : ${responce.body}");
  try {
    if (responce.statusCode == 200) {
      //print("success");
      final json =jsonDecode(responce.body);
      final res = (json as List).map((e) => StopOrderRouteModel.fromJson(e)).toList();
      return res;
    }
    else{
      //print("Else ");
      return busstops;
    }
  } catch (e) {
    print(e.toString());
    return busstops;
  }
}
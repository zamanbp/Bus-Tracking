import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';
import 'package:major_project/model/busByStopsModel.dart';
import 'package:major_project/model/busDetails.dart';
import 'package:major_project/model/notification.dart';


Future<List<NotificationModel>> getNotification() async{
  try {
  final uri = Uri.parse("$baseUrl/get_stops_list?logid=3");
  final responce = await http.get(uri);
  print(responce.statusCode);
  print("body:  ${responce.body}");
    if (responce.statusCode >= 200 || responce.statusCode < 300) {
       final res = jsonDecode(responce.body);
       final datas = (res as List).map((e) => NotificationModel.fromJson(e)).toList();
      print("success");
      return datas;
    }
    else{
      print("Else ");
      return notificationList;
    }
  } catch (e) {
    print(e.toString());
    return notificationList;
  }
}
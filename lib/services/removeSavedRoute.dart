import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';

Future<String> deleteRouteApi(String routeid) async{
  var client = http.Client();
  try {
    final responce = await client.get(Uri.parse("$baseUrl/deletesavedroute?logid=$loginId&route=$routeid"));
    print("status : ${responce.body}");
    if (responce.statusCode == 200 ) {
      final res = jsonDecode(responce.body);
      if (res["task"] == "success") {
        return "success";
      }
      else{
        return "failed";
      }
    }
    else{
      print(responce.statusCode);
      return "failed";

    }
  } catch (e) {
    print("catch : ${e.toString()}");
    return "failed";
  }
  
}
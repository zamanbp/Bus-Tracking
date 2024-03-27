import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';


Future<String> saveRouteApi(String rid, String end,String start,String lid) async{
  
  var client = http.Client();
  try {
    final responce = await client.get(Uri.parse("$baseUrl/saveroute?rid=$rid&start=$start&end=$end&logid=$lid"));
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
    //return null;
    return "failed";
  }
  
}
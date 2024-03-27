import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';
import 'package:major_project/services/userRegModel.dart';

Future<String> registrationApi(UserReg user) async{

  var client = http.Client();
  try {
    final responce = await client.get(Uri.parse("$baseUrl/signup?username=${user.name}&phno=${user.phone}&email=${user.email}&password=${user.password}"));
    print(responce.statusCode);
    if (responce.statusCode == 200) {
      print("success");
      return "success";
    }
    else{
      print(responce.statusCode);
      return "failed";
    }
  } catch (e) { 
    print(e.toString());
    return "failed";
  }
}
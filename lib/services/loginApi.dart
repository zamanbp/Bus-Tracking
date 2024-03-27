import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:major_project/constants/globalVar.dart';
import 'package:major_project/constants/urls.dart';


Future<String> loginApi(String email, String password) async{
  
  var client = http.Client();
  try {
    final responce = await client.get(Uri.parse("$baseUrl/logincheck1?email=$email&password=$password"));
    print("status : ${responce.body}");
    if (responce.statusCode == 200 ) {
      final res = jsonDecode(responce.body);

        loginId = res["lid"];
      
      return "success";
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
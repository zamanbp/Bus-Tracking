import 'package:http/http.dart' as http;
import 'package:major_project/constants/urls.dart';


getBusWithStops() async{
  final uri = Uri.parse("$baseUrl/getbus?fromstop=Kozhikode&tostop=Ayanikkad");
  final responce = await http.get(uri);
  print(responce.statusCode);

  try {
    if (responce.statusCode == 200) {
      print("success");
    }
    else{
      print("Else ");
    }
  } catch (e) {
    print(e.toString());
  }
}
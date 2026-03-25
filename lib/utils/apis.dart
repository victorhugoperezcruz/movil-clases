
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouteServices {
  OpenRouteServices({required this.startLng,required this.startLat,
    required this.endLng,required this.endLat});

  final String url ='https://api.openrouteservice.org/v2/directions/';
  final String apiKey = 'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjZhMjAxOTgzYTdlODQ5ODA4NjJjY2Q3OWRhMDQ3ZTgwIiwiaCI6Im11cm11cjY0In0=';
  final String journeyMode = 'driving-car'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async{

    //construir la url válida para el llamado de la api
    //A través de http, nos permite realizar el llamado a través de internet

    http.Response response = await http.get(Uri.parse('$url$journeyMode?'
        'api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat'));
    print("$url$journeyMode?$apiKey&start=$startLng,$startLat&end=$endLng,$endLat");

    if(response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }
}
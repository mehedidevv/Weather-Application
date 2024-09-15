import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{

  NetworkHelper(this.url);
  final String url;


  //TODO Make Network Req. FetchData Method
  Future getData() async {

    //const apiKEY="7895640c2d6eab69b7747365d437a53a";

    //https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKEY

    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      String data=response.body;
      return jsonDecode(data);

      // var temp=result['main']['temp_min'];
      // var weatheDes=result['weather'][0]['description'];
      // print(temp);
      // print(weatheDes);
    }else{
      print(response.statusCode);
    }

  }
}
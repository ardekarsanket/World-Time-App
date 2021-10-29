import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  var location;
  var time;
  var flag;
  var variable; 
  var isDayTime;

  WorldTime(this.variable,this.location,this.flag);

  Future<void> getTime() async {

    try{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$variable'));
    Map data = jsonDecode(response.body);
    //print(data);
    var datetime = data['datetime'];
    var offset_hr = data['utc_offset'].substring(1,3);
    var offset_min = data['utc_offset'].substring(4,6);
    // print('$datetime $offset');

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset_hr),minutes: int.parse(offset_min)));
    isDayTime = (now.hour > 5 && now.hour <19) ? true : false;
    time = DateFormat.jm().format(now);
    }catch(e){
      time = 'could not get time';
    }
  }

}
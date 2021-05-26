import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
String time;
String location;
String flag;
String url;//True for day False for Night

WorldTime({this.location,this.time,this.flag,this.url});

Future <String> getTime()async {
  List minuteHoursOffset(String offset){
    String sign=offset[0];
    int hours=int.parse(offset.substring(1,3));
    if (sign=='-'){hours*=-1;}
    int minutes=int.parse(offset.substring(4,6));
    return [hours,minutes];
  }
  try {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map Data = jsonDecode(response.body);

    String datetime = Data['datetime'];
    String offset = Data['utc_offset'];

    List hoursmins = minuteHoursOffset(offset);

    DateTime d = DateTime.parse(datetime);
    d = d.add(Duration(hours: hoursmins[0], minutes: hoursmins[1]));

    return DateFormat.jm().format(d).toString();
  }
  catch(e){this.time='Some Error occured!';}
}
}
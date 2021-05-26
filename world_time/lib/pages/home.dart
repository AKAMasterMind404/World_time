import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/pages/error_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dayNightChecker(String giventime){
    String timeIs='';
    int i;
    String hour='';
    for (i=0;i<2;i++){
      String z=giventime[i];
      if (z!=':'){
        hour+=z;
      }
      else {break;}
    }
    String MN=giventime[giventime.length-2];
    int time1=int.parse(hour);
    if (MN=='P') {
      time1 = int.parse(hour) + 12;
    }
    if ((time1>=0 && time1<6) || (time1>=20 && time1<=23) ||(time1==12))
    {
      timeIs='night';
    }
    else if(time1>=6 && time1<12){
      timeIs='morning';
    }
    else{
      timeIs='evening';
    }
    return timeIs;
  }

  @override
  Widget build(BuildContext context) {
      Map data=ModalRoute.of(context).settings.arguments;
      if (data['time']!=null){
      String l=data['location'];
      String t=data['time'];
      String flagloc=data['flag'];
      String isDayTime=dayNightChecker(t);//Returns evening day or night
      String img;
      Color up;
      Color down;
    if (isDayTime=='evening'){
      img='evening.jpg';
      up=Colors.black;
      down=Colors.white;
    }
    else if (isDayTime=='morning'){
      img='morning.jpg';
      up=Colors.white;
      down=Colors.white;
    }
    else if (isDayTime=='night'){
      up=Colors.white;
      down=Colors.white;
      if (t!='12:43 AM') {
        img = 'night.jpg';
      }
      else{
        img='specific.jpg';
      }
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return Scaffold(
      body:Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('lib/assets/used/$img'),fit: BoxFit.fill)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children:[
                            SizedBox(height: 40),
                            Text('$l',style: TextStyle(fontSize: 30,color:up),),
                            SizedBox(height: 10),
                            Text('$t',style: TextStyle(fontSize: 40,color:up)),]),
                  Column(
                            children:[Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:<Widget>[
                              FlatButton.icon(onPressed: (){Navigator.pushReplacementNamed(context, '/location');},icon: Icon(Icons.edit_location,color: Colors.white,),label: Text('Location',style: TextStyle(color: down,fontSize: 20))),
                              FlatButton.icon(onPressed: (){Navigator.pushReplacementNamed(context, '/');},icon: Icon(Icons.refresh,color: Colors.white),label: Text('Refresh',style: TextStyle(color: down,fontSize: 20))),
                              SizedBox(height: 70,)
                        ]
                        ), SizedBox(height: 15,)]
                  )
                ]
              )
      ),
    );
  }
  else{
    return Error();
  }
}}
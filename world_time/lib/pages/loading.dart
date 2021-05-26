import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime(WorldTime instance)async{
    instance.time=await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time
    });
  }
  String t1='';
  String l1='';

  WorldTime o1=WorldTime(location: 'Kolkata', flag:'assets/india.jpg', url:'Asia/Kolkata');

  void initState() {
    super.initState();
    setupWorldTime(o1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(child:
      Column(children:<Widget>[
        SizedBox(height: 160),
        Text('Loading...', style: TextStyle(fontSize: 60,color: Colors.white)),
        SizedBox(height: 20),
        SpinKitRing(
          color:Colors.white,
          size:60,
          ),
      ])
      ),
    );
  }
}
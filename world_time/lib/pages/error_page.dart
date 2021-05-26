import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('lib/assets/used/error.jpg'),fit: BoxFit.fill)
          ),
          child: Column(children: <Widget>[
            SizedBox(height: 600),
            Container(child: Center(child:Column(children: <Widget>[
              Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:<Widget>[
                FlatButton.icon(onPressed: (){Navigator.pushReplacementNamed(context, '/');},icon: Icon(Icons.refresh),color: Colors.white,label: Text('Refresh',style: TextStyle(color: Colors.black))),
              ]

              )],)))
          ],)),
    );
  }
}

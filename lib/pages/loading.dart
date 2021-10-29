import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime()async{
    WorldTime instance = WorldTime('Asia/Kolkata','India','india.png');
    await instance.getTime();
    // new Future.delayed(const Duration(seconds: 1),(){
      
    // });
    Navigator.pushReplacementNamed(context, '/home',arguments: {
       'location' : instance.location,
       'flag' : instance.flag,
       'time' : instance.time,
       'isDayTime' : instance.isDayTime,
    });
  }

  void initState(){
    super.initState();
    setUpWorldTime();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child:  SpinKitDualRing(
        color: Colors.white,
        size: 50.0,
       ),
      )
    );
  }
}
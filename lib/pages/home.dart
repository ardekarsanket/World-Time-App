import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map:data;
    // print(data);
    data['isDayTime'] = false;
    var bgImage  = data['isDayTime']?'day.png':'night.png';
    var bgColor = data['isDayTime']?Colors.lightBlue[300]:Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: [
              TextButton.icon(
                onPressed: () async{
                  dynamic result  = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time':result['time'],
                      'location':result['location'],
                      'isDayTime':result['isDayTime'],
                      'flag':result['flag'],
                    };
                  });
                }, 
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    // side: BorderSide(color: Colors.red)
                  )
                )
                ),
                icon: Icon(Icons.edit_location,
                color: Colors.white,
                ), 
                label: Text('Edit Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  letterSpacing: 2
                ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66,
                    letterSpacing: 1,
                  ),
                )
            ],),
          ),
        )
      ),
    );
  }
}
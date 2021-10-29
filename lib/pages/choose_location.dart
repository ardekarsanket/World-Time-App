import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

   List<WorldTime> locations = [
    WorldTime('Asia/Kolkata','India','india.png'),
    WorldTime('Europe/London','London','uk.png'),
    WorldTime('Europe/Berlin','Athens','greece.png'),
    WorldTime('Africa/Cairo','Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi','Nairobi','kenya.png'),
    WorldTime('America/New_York','New York','usa.png'),
    WorldTime('Asia/Seoul','Seoul','south_korea.png'),
    WorldTime('Asia/Jakarta','Jakarta','indonesia.png'),
    WorldTime('Asia/Tokyo','Japan','japan.png'),
    WorldTime('Asia/Singapore','Singapore','singapore.png'),
  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
       'flag' : instance.flag,
       'time' : instance.time,
       'isDayTime' : instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}
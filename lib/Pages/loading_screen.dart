import 'package:flutter/material.dart';
import 'package:clock_app/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setTime() async{

    WorldTime world = WorldTime(flag: 'India.png', url: 'Asia/Kolkata', location: 'India');
    await world.getTime();
    //print(world.time);

    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'time': world.time,
      'flag': world.flag,
      'location': world.location,
      'isDayTime': world.isDayTime,
    });

}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}

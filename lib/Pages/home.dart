import 'package:clock_app/Pages/choose_location.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  String ? bgImage;
  Color ? txtColor;
  Color ? bgColor;



  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map; // for accepting/storing data from another route
    print('$data');

    bgImage = data['isDayTime']  ? 'day.jpg' : 'night.jpg';
    //print(bgImage);

    txtColor = data['isDayTime'] ? Colors.black : Colors.grey[300];
    bgColor = data['isDayTime'] ? Colors.blue[200] : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 390.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('${data['flag']}'),
                      radius: 39.0,
                    ),
                    SizedBox(width: 16.0,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                        child: Text(
                          data['location'],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                            fontSize: 70.0,
                            color: txtColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Manrope',
                    fontSize: 30.0,
                      color: txtColor,
                  ),
                ),
                SizedBox(height: 50.0),
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseLocation()));
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.location_on_sharp,
                    size: 35.0,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Protest',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

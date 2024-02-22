import 'package:clock_app/services/worldtime.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(flag: 'assets/India.png', url: 'Asia/Kolkata', location: 'India'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'assets/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),

    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'assets/indonesia.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'assets/singapore.png'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'assets/qatar.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Pakistan', flag: 'assets/pakistan.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Sri Lanka', flag: 'assets/sriLanka.png'),

    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'assets/nigeria.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'assets/south_africa.png'),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag: 'assets/algeria.png'),

    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'assets/usa.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'assets/canada.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'assets/mexico.png'),
    WorldTime(url: 'America/Buenos_Aires', location: 'Buenos Aires', flag: 'assets/argentina.png'),
  ];



  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location': locations[index].location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Location',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // print(locations[index].location);
                  updateTime(index);
                },
                contentPadding: EdgeInsets.all(18.0),
                title: Text(
                  locations[index].location!,
                  style: TextStyle(
                    fontFamily: 'Protest',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag!),
                  radius: 30.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

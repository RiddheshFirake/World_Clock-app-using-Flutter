import 'dart:core';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';


class WorldTime {

  String time = '';  // For UI purpose
  String ? flag;   //for UI purpose
  String ? url; // for getting the location of endpoint url
  String ? location; // for UI purpose
  bool ? isDayTime;
  String ? isAm;

  WorldTime({ required this.flag, required this.url , required this.location});



  Future<void> getTime() async {
    try {
      // Make request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')) as Response;

      // Print response status code for debugging
      print('Response Status Code: ${response.statusCode}');

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        // Print response body for debugging
        print('Response Body: $data');

        // get properties from the data
        String dateTime = data['utc_datetime'];
        String offset = data['utc_offset'].substring(0, 3);
        print(offset);
        String offset1 = data['utc_offset'].substring(4, 6);

        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset1)));

        // Corrected isDayTime logic
        isDayTime = now.hour >= 6 && now.hour < 18;

        time = DateFormat.jm().format(now);

        // Adjusted substring operation to prevent RangeError
        isAm = time.length >= 8 ? time.substring(6, 8) : '';
      } else {
        // Handle unsuccessful response
        time = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      // Handle exceptions
      time = 'Error fetching the data: $e';
    }
  }





}





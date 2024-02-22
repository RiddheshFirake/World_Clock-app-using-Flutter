import 'package:clock_app/Pages/choose_location.dart';
import 'package:clock_app/Pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/Pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}



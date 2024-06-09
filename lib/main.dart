import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Pages/landing_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        // Set the primary color to your desired color
        primaryColor: Colors.blue,
        // Set the color of the Radio widget
        unselectedWidgetColor: Colors.white,
      ),
      home: LandingPage(),
      
      
    );
  }
}
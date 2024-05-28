import 'package:flutter/material.dart';

class Smallcontainer extends StatefulWidget {
  const Smallcontainer({super.key});

  @override
  State<Smallcontainer> createState() => _SmallcontainerState();
}

class _SmallcontainerState extends State<Smallcontainer> {
  String? text;
  String? temp_in_celc;
  String? temp_in_fahr;
  String? WeatherIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[Text('$text', style: TextStyle(color:Colors.white)),]
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset(
                  '$WeatherIcon',
                  height: 7,
                  width: 7,
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$temp_in_celc / $temp_in_fahr', style: TextStyle(color:Colors.white)),
            ],
          )
        ],
      )
      
      
      
    );
  }
}
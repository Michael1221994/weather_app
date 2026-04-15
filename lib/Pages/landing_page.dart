import 'package:flutter/material.dart';
import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/util/button.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => __LandingPageState();
}

class __LandingPageState extends State<LandingPage> {
  Color? backgroundColor= Colors.transparent;
  Color? TextColor= Colors.white; 



void Go_To_Homepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
  setState(() {
    TextColor= Colors.black;
    backgroundColor= Colors.white;
  });
  

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
           begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 61, 15, 1),
            Color.fromARGB(244, 182, 100, 6),
            Color.fromARGB(255, 6, 105, 105),
            Color.fromARGB(255, 4, 6, 119)
          ],
         
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Olympus Forecast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Get current weather and forecast quickly.',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 25,),
              MyButton (on_pressed:() => Go_To_Homepage(context), color:backgroundColor, text: "Continue",textcolor:TextColor , ),
            ]
            ),
           ),
        ),
      ),
        
    );
  }
}

 
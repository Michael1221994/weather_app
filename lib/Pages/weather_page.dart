import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: size.width *1,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,                                             
                      )
                    ),                    
                  )
                ],
              ),

              Row(
                children: [                  
                    Padding(
                      padding: const EdgeInsets.only(top:8.0, right: 8.0, bottom: 8.0),
                      child: Container(
                        width: size.width*0.49,
                        height: size.height*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,                                             
                          )
                        ),
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top:8.0,  bottom: 8.0),
                     child: Container(
                      width: size.width*0.488,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,                                             
                        )
                      ),
                                       ),
                   ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Container(
                      width: size.width,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,                                             
                        )
                      ),                    
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text('Forecast', style: TextStyle(color: Colors.white),),
                    ),
                    width: size.width,
                    height: size.height*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,                                             
                      )
                    ),
                 
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
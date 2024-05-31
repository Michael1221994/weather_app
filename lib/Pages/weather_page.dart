import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 100,
              child: Builder(
                builder: (context) {
                  return Column(
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  )
                                ),
                            
                          )
                        ],
                      ),
                       Row(
                         children: [
                           Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  )
                                ),
                              )
                            ],
                           ),
                           Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  )
                                ),
                              )
                            ],
                           ),
                         ],
                       ),
                       SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                          ],
                         
                          ),
                       ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Text("Forecast", style: TextStyle(color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              ),
             
            ),
          ),
        ),
      ),
    );
  }
}
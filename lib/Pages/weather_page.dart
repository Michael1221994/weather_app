import 'package:flutter/material.dart';
import 'package:weather_app/API/API_service.dart';
import 'package:weather_app/API/weather.dart';
import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/util/smallcontainer.dart';

import '../util/countrydropdown.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? q=HomePageState.city?? Country_dropdownbtn.selectedcountry;
  ActualWeatherData current_weather= ApiService().fetch_current_weather(HomePageState.city?? Country_dropdownbtn.selectedcountry as String  ) as ActualWeatherData;
  Forecast forecast= ApiService().fetchForecast(HomePageState.city?? Country_dropdownbtn.selectedcountry as String, days: 1, dt: 'no') as Forecast;
  
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                              Image.asset(
                                current_weather.current.condition.icon,
                                height: size.height * 0.2,
                                width: size.width * 0.3,
                                fit: BoxFit.fitHeight,
                              ),
                          ]
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(current_weather.current.condition.text, style: const TextStyle(color: Colors.white),),
                                Text('${current_weather.current.tempC}c\ ${current_weather.current.tempF}f', style: const TextStyle(color: Colors.white),),
                                Text('Wind: ${current_weather.current.windKph}km\ ${current_weather.current.windMph}mph', style: const TextStyle(color: Colors.white),),
                                Text('Precipitation: ${current_weather.current.precipMm}mm\ ${current_weather.current.precipIn}inches', style: const TextStyle(color: Colors.white),),
                                Text('Humidity: ${current_weather.current.humidity}%', style: const TextStyle(color: Colors.white),),
                              ],
                            ),
                          ]
                        )
                      ],
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
                        child: Column(
                          children: [
                            Text('Feels Like: ${current_weather.current.feelslikeC}c\ ${current_weather.current.feelslikeF}f',style: const TextStyle(color: Colors.white),),
                            Text('Max temp: ${forecast.forecastday[0].day.maxtempC}c\ ${forecast.forecastday[0].day.maxtempF}f',style: const TextStyle(color: Colors.white),),
                            Text('Max wind: ${forecast.forecastday[0].day.maxwindKph}km\ ${forecast.forecastday[0].day.maxwindMph}mph',style: const TextStyle(color: Colors.white),),
                            Text('chance of rain: ${forecast.forecastday[0].day.dailyChanceOfRain}%',style: const TextStyle(color: Colors.white),),
                          ]
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
                      child: Column(
                        children: [
                          Text('Sunrise: ${forecast.forecastday[0].astro.sunrise}',style: const TextStyle(color: Colors.white),),
                          Text('Sunset: ${forecast.forecastday[0].astro.sunset}',style: const TextStyle(color: Colors.white),),
                          Text('Moonrise: ${forecast.forecastday[0].astro.moonrise}',style: const TextStyle(color: Colors.white),),
                          Text('Moonset: ${forecast.forecastday[0].astro.moonset}',style: const TextStyle(color: Colors.white),),
                        ]
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
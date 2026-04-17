import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/API/API_service.dart';
import 'package:weather_app/API/weather.dart';
import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/util/smallcontainer.dart';
import 'dart:async';

import '../util/countrydropdown.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late ActualWeatherData current_weather;
  late Forecast forecast;  
  late String q;
  bool isLoading = true; // Track loading state
  String? errorMessage;
  
   @override
  void initState() {
    super.initState();
    _fetchData();
  }
  Future<void> _fetchData() async {
    if(HomePageState.city!=null){
      print('City: ${HomePageState.city}' );
      q=HomePageState.city!;
    }
    else{
      print('Country_dropdownbtn: ${Country_dropdownbtn.selectedcountry}');
      q=Country_dropdownbtn.selectedcountry!;
    }
    try {
       current_weather = await ApiService().fetch_current_weather(q);
       print(current_weather);
       forecast = await ApiService().fetchForecast(q, days:14, aqi:'no', alerts:'no');
       print(forecast);
       setState(() {
        isLoading = false; // Update loading state
      });
    } catch (e) {
      // Handle any errors that may occur during the fetch
      print('Error fetching data: $e');
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  // Future<void> _fetchData() async {
  // current_weather= await ApiService().fetch_current_weather(HomePageState.city?? Country_dropdownbtn.selectedcountry as String  );
  // forecast= await ApiService().fetchForecast(HomePageState.city?? Country_dropdownbtn.selectedcountry as String, days: 1, dt: 'no') ;}
  
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     String extractTime(String dateTime) {
        return dateTime.split(' ')[1];
      }
     if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Could not load weather data.\n$errorMessage',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
      
    final forecastDays = forecast.forecast.forecastday;
    final firstDayHours =
        forecastDays.isNotEmpty ? forecastDays.first.hour : <dynamic>[];

    final List<Smallcontainer> hourlyContainers = firstDayHours
        .take(24)
        .map<Smallcontainer>(
          (hourData) => Smallcontainer(
            text: extractTime(hourData.time),
            temp_in_celc: hourData.tempC,
            temp_in_fahr: hourData.tempF,
            WeatherIcon: hourData.condition.icon,
            descriptiontext: hourData.condition.text,
          ),
        )
        .toList(growable: false);

    final List<Smallcontainer> forecastContainers = forecastDays
        .take(14)
        .map<Smallcontainer>(
          (dayData) => Smallcontainer(
            text: dayData.date,
            temp_in_celc: dayData.day.maxtempC,
            temp_in_fahr: dayData.day.maxtempF,
            WeatherIcon: dayData.day.condition.icon,
            descriptiontext: dayData.day.condition.text,
          ),
        )
        .toList(growable: false);
  

    
    return Scaffold(
      
      //backgroundColor: Color.fromARGB(255, 31, 145, 110),
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
           begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 70, 75, 3),
            Color.fromARGB(244, 117, 95, 4),
            Color.fromARGB(255, 6, 105, 105),
            Color.fromARGB(255, 18, 76, 99)
          ],
         
        ),
      ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: size.width *0.95,
                          height: size.height * 0.24,
                           decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.1),
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(
                               color: Colors.white.withOpacity(0.2),
                               width: 0.5,
                             )
                           ),  
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                                children: [
                                  Expanded(
                                    child:Image.network(
                                      'http:${current_weather.current.condition.icon}',
                                      height: size.height * 0.3,
                                      width: size.width * 0.3,
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, error, stackTrace) {
                                      print('Error loading image: $error');
                                      return const Icon(Icons.error_outline);
                                    },
                                    ),
                    
                                  ),
                                   Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(current_weather.current.condition.text, style: const TextStyle(color: Colors.white),),
                                          Text('Temp: ${current_weather.current.tempC}c / ${current_weather.current.tempF}f', style: const TextStyle(color: Colors.white, fontSize: 12),),
                                          Text('Wind: ${current_weather.current.windKph}km / ${current_weather.current.windMph}mph', style: const TextStyle(color: Colors.white, fontSize: 12),),
                                          Text('Precip:${current_weather.current.precipMm}mm/ ${current_weather.current.precipIn}in', style: const TextStyle(color: Colors.white, fontSize: 12),),
                                          Text('Humidity: ${current_weather.current.humidity}%', style: const TextStyle(color: Colors.white, fontSize: 12),),
                                        ],
                                      ),
                                    ),
                                ],
                             ),
                           ),                 
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: size.height * 0.05, top: size.height * 0.02),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                        width: size.width * 0.49,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.5,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                // Content for the first column
                                Text('Date: ${forecast.forecast.forecastday[0].date}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Feels Like: ${current_weather.current.feelslikeC}c/ ${current_weather.current.feelslikeF}f',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Max temp: ${forecast.forecast.forecastday[0].day.maxtempC}c/ ${forecast.forecast.forecastday[0].day.maxtempF}f',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Max wind: ${forecast.forecast.forecastday[0].day.maxwindKph}km/ ${forecast.forecast.forecastday[0].day.maxwindMph}mph',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('chance of rain: ${forecast.forecast.forecastday[0].day.dailyChanceOfRain}%',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Cloud:${forecast.current.cloud}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Gust: ${forecast.current.gustKph}km/ ${forecast.current.gustMph}mph',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('UV: ${forecast.current.uv}',style: const TextStyle(color: Colors.white),),
                                Text('Visibility: ${forecast.current.visKm}km/ ${forecast.current.visMiles}miles',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Pressure: ${forecast.current.pressureMb}mb/ ${forecast.current.pressureIn}in}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                      ],
                            ),
                        ),
                        ),
                      ),
                        const SizedBox(width: 5),
                   Flexible(
                    flex: 2,
                      child: Container(
                        width: size.width * 0.51,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.5,
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Content for the second column
                               Text('Location: ${forecast.location.name}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('M Phase: ${forecast.forecast.forecastday[0].astro.moonPhase}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Sunrise: ${forecast.forecast.forecastday[0].astro.sunrise}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Sunset: ${forecast.forecast.forecastday[0].astro.sunset}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Moonrise: ${forecast.forecast.forecastday[0].astro.moonrise}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Moonset: ${forecast.forecast.forecastday[0].astro.moonset}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Latitude: ${forecast.location.lat}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                               Text('Longitude: ${forecast.location.lon}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                  
                            ],
                          ),
                        ),
                      ),
                    ),                  
                    ]
                  ),
                ),
                Container(
                  width: size.width,
                        height: size.height*0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.5,                                             
                          )
                        ),               
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left:20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [                                
                                     Text('Hourly Forecast', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'anton' ),),
                                    
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.only(top:size.height*0.005),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: hourlyContainers.map((item) {
                                          return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                          child: item,);
                                        }  
                                        ).toList(growable: false),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Container(
                        width: size.width,
                        height: size.height*0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.5,                                             
                          )
                        ),               
                        child: Column(
                          children: [
        
                            const Padding(
                              padding: EdgeInsets.only(left:20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right:0, left:0),
                                    child: Text('Forecast', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'anton' ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:size.height*0.005),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: forecastContainers.map((item) {
                                    return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                    child: item,);
                                  }  
                                  ).toList(growable: false),
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                )
        
        
              ]
            )
            ),
        ),
      )
    );
  }
}
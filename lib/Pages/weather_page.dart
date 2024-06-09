import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/API/API_service.dart';
import 'package:weather_app/API/weather.dart';
import 'package:weather_app/Pages/home.dart';
import 'package:weather_app/util/smallcontainer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io' as io;

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
       forecast = await ApiService().fetchForecast('${q}', days:14, aqi:'no', alerts:'no');
       print(forecast);
       setState(() {
        isLoading = false; // Update loading state
      });
    } catch (e) {
      // Handle any errors that may occur during the fetch
      print('Error fetching data: $e');
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
      return Center(child: CircularProgressIndicator());}
      
      final List<Smallcontainer> hourlyContainers=[
      Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[0].time),       //1
            temp_in_celc: forecast.forecast.forecastday[0].hour[0].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[0].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[0].condition.icon, 
            descriptiontext: forecast.forecast.forecastday[0].hour[0].condition.text,     
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[1].time),    //2
            temp_in_celc: forecast.forecast.forecastday[0].hour[1].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[1].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[1].condition.icon,  
            descriptiontext: forecast.forecast.forecastday[0].hour[1].condition.text,    
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[2].time),    //3
            temp_in_celc: forecast.forecast.forecastday[0].hour[2].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[2].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[2].condition.icon, 
            descriptiontext: forecast.forecast.forecastday[0].hour[2].condition.text,        
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[3].time),     //4
            temp_in_celc: forecast.forecast.forecastday[0].hour[3].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[3].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[3].condition.icon,    
            descriptiontext: forecast.forecast.forecastday[0].hour[3].condition.text,     
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[4].time),     //5
            temp_in_celc: forecast.forecast.forecastday[0].hour[4].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[4].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[4].condition.icon,     
            descriptiontext: forecast.forecast.forecastday[0].hour[4].condition.text,    
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[5].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[5].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[5].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[5].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[5].condition.text,     
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[6].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[6].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[6].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[6].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[6].condition.text,          
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[7].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[7].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[7].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[7].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[7].condition.text,         
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[8].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[8].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[8].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[8].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[8].condition.text,       
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[9].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[9].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[9].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[9].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[9].condition.text,         
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[10].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[10].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[10].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[10].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[10].condition.text,         
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[11].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[11].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[11].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[11].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[11].condition.text,         
          ),
          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[12].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[12].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[12].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[12].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[12].condition.text,            
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[13].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[13].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[13].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[13].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[13].condition.text,            
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[14].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[14].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[14].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[14].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[14].condition.text,           
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[15].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[15].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[15].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[15].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[15].condition.text,          
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[16].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[16].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[16].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[16].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[16].condition.text,              
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[17].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[17].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[17].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[17].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[17].condition.text,        
          ),
        Smallcontainer(
          text: extractTime(forecast.forecast.forecastday[0].hour[18].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[18].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[18].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[18].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[18].condition.text,           
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[19].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[19].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[19].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[19].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[19].condition.text,           
          ),
        Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[20].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[20].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[20].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[20].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[20].condition.text,       
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[21].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[21].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[21].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[21].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[21].condition.text,            
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[22].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[22].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[22].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[22].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[22].condition.text,     
          ),

          Smallcontainer(
            text: extractTime(forecast.forecast.forecastday[0].hour[23].time),     //6
            temp_in_celc: forecast.forecast.forecastday[0].hour[23].tempC,
            temp_in_fahr: forecast.forecast.forecastday[0].hour[23].tempF,
            WeatherIcon: forecast.forecast.forecastday[0].hour[23].condition.icon,    
            descriptiontext:  forecast.forecast.forecastday[0].hour[23].condition.text,           
          ),
    ];

    final List<Smallcontainer> forecastContainers= [
      Smallcontainer(
            text: forecast.forecast.forecastday[0].date,       //1
            temp_in_celc: forecast.forecast.forecastday[0].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[0].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[0].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[0].day.condition.text,        
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[1].date,       //1
            temp_in_celc: forecast.forecast.forecastday[1].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[1].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[1].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[1].day.condition.text,      
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[2].date,       //1
            temp_in_celc: forecast.forecast.forecastday[2].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[2].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[2].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[2].day.condition.text,      
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[3].date,       //1
            temp_in_celc: forecast.forecast.forecastday[3].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[3].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[3].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[3].day.condition.text,    
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[4].date,       //1
            temp_in_celc: forecast.forecast.forecastday[4].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[4].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[4].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[4].day.condition.text,       
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[5].date,       //1
            temp_in_celc: forecast.forecast.forecastday[5].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[5].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[5].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[5].day.condition.text,      
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[6].date,       //1
            temp_in_celc: forecast.forecast.forecastday[6].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[6].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[6].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[6].day.condition.text,      
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[7].date,       //1
            temp_in_celc: forecast.forecast.forecastday[7].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[7].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[7].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[7].day.condition.text,     
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[8].date,       //1
            temp_in_celc: forecast.forecast.forecastday[8].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[8].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[8].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[8].day.condition.text,    
          ),

          Smallcontainer(
            text: forecast.forecast.forecastday[9].date,       //1
            temp_in_celc: forecast.forecast.forecastday[9].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[9].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[9].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[9].day.condition.text,    
          ),

          Smallcontainer(
            text: forecast.forecast.forecastday[10].date,       //1
            temp_in_celc: forecast.forecast.forecastday[10].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[10].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[10].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[10].day.condition.text,      
          ),

          Smallcontainer(
            text: forecast.forecast.forecastday[11].date,       //1
            temp_in_celc: forecast.forecast.forecastday[11].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[11].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[11].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[11].day.condition.text,         
          ),
          Smallcontainer(
            text: forecast.forecast.forecastday[12].date,       //1
            temp_in_celc: forecast.forecast.forecastday[12].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[12].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[12].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[12].day.condition.text,    
          ),
        Smallcontainer(
            text: forecast.forecast.forecastday[13].date,       //1
            temp_in_celc: forecast.forecast.forecastday[13].day.maxtempC,
            temp_in_fahr: forecast.forecast.forecastday[13].day.maxtempF,
            WeatherIcon: forecast.forecast.forecastday[13].day.condition.icon, 
            descriptiontext: forecast.forecast.forecastday[13].day.condition.text,      
          ),
        
    ];
  

    
    return Scaffold(
      
      //backgroundColor: Color.fromARGB(255, 31, 145, 110),
      body: Container(
        decoration: BoxDecoration(
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
            padding: EdgeInsets.only(top: 50.0),
            child: isLoading
                ? CircularProgressIndicator()
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
                                Text('Cloud:${forecast.current.cloud}',style: TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Gust: ${forecast.current.gustKph}km/ ${forecast.current.gustMph}mph',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('UV: ${forecast.current.uv}',style: const TextStyle(color: Colors.white),),
                                Text('Visibility: ${forecast.current.visKm}km/ ${forecast.current.visMiles}miles',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                Text('Pressure: ${forecast.current.pressureMb}mb/ ${forecast.current.pressureIn}in}',style: const TextStyle(color: Colors.white, fontSize: 12),),
                                      ],
                            ),
                        ),
                        ),
                      ),
                        SizedBox(width: 5),
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
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
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
                                  children: hourlyContainers.map((Container) {
                                          return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                          child: Container,);
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
        
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:0, left:0),
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
                                  children: forecastContainers.map((Container) {
                                    return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Container,);
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
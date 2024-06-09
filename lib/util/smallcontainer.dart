import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/API/weather.dart';
import 'dart:convert';
import 'package:weather_app/API/API_service.dart';
import 'package:weather_app/Pages/home.dart';
import '../API/weather.dart';
import 'package:weather_app/util/countrydropdown.dart';

class Smallcontainer extends StatefulWidget {
    final String text;
    final double temp_in_celc;
    final double temp_in_fahr;
    final String WeatherIcon;
    final String descriptiontext;

   Smallcontainer({
    super.key,
    required this.text,
    required this.temp_in_celc,
    required this.temp_in_fahr,
    required this.WeatherIcon,
    required this.descriptiontext,
    });
    

  @override
  State<Smallcontainer> createState() => _SmallcontainerState();
}

class _SmallcontainerState extends State<Smallcontainer> {
  late Future<Forecast> forecast;
  //String city= HomePage.city?? Country_dropdownbtn._selectedcountry;
  
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;

    // try{
    //   forecast= ApiService().fetchForecast(city, days: 14, dt: 'no');
    // }catch (e){}
    return Container(
      decoration:BoxDecoration(
         color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 0.5,
        ),
      ),
      height: size.height * 0.16,
      width: size.width * 0.3,
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex:1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[Text(widget.text, style: TextStyle(color:Colors.white)),]
                ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.network(
                      'http:${widget.WeatherIcon}',
                      height: size.height * 0.15,
                      width: size.width * 0.15,
                      fit: BoxFit.fill,
                    )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${widget.descriptiontext}', style: TextStyle(color:Colors.white, fontSize: 10), overflow: TextOverflow.fade, softWrap: false, maxLines: 2),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.temp_in_celc}c / ${widget.temp_in_fahr}f', style: TextStyle(color:Colors.white, fontSize: 10)),
                ],
              ),
            )
          ],
        ),
      );
  }

  
  
}


// class SmallContainerlist{
  
// }

//   String? city = HomePageState.city ?? Country_dropdownbtn.selectedcountry;
//   Forecast forecast= ApiService().fetchForecast(city as String, days: 14, aqi: 'no,' , alerts: 'no') as Forecast;
//   abstract class _SmallcontainerlistState extends State<Smallcontainer> {
//     String? city = HomePageState.city ?? Country_dropdownbtn.selectedcountry;
//     late Forecast forecast;

//     @override
//     void initState() {
//       super.initState();
//       _fetchForecast();
//     }

//     Future<void> _fetchForecast() async {
//       try {
//         forecast = await ApiService().fetchForecast(city!, days: 14, aqi: 'no', alerts: 'no');
//         setState(() {});
//       } catch (e) {
//         print('Error fetching forecast: $e');
//       }
//     }
        
  //   final List<Smallcontainer> hourlyContainers=[
  //     Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[0].time,       //1
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[0].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[0].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[0].condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[0].hour[0].condition.text,     
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[1].time,    //2
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[1].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[1].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[1].condition.icon,  
  //           descriptiontext: forecast.forecast.forecastday[0].hour[1].condition.text,    
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[2].time,    //3
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[2].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[2].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[2].condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[0].hour[2].condition.text,        
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[3].time,     //4
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[3].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[3].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[3].condition.icon,    
  //           descriptiontext: forecast.forecast.forecastday[0].hour[3].condition.text,     
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[4].time,     //5
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[4].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[4].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[4].condition.icon,     
  //           descriptiontext: forecast.forecast.forecastday[0].hour[4].condition.text,    
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[5].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[5].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[5].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[5].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[5].condition.text,     
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[6].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[6].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[6].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[6].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[6].condition.text,          
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[7].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[7].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[7].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[7].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[7].condition.text,         
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[8].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[8].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[8].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[8].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[8].condition.text,       
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[9].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[9].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[9].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[9].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[9].condition.text,         
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[10].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[10].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[10].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[10].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[10].condition.text,         
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[11].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[11].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[11].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[11].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[11].condition.text,         
  //         ),
  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[12].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[12].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[12].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[12].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[12].condition.text,            
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[13].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[13].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[13].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[13].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[13].condition.text,            
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[14].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[14].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[14].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[14].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[14].condition.text,           
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[15].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[15].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[15].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[15].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[15].condition.text,          
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[16].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[16].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[16].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[16].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[16].condition.text,              
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[17].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[17].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[17].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[17].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[17].condition.text,        
  //         ),
  //       Smallcontainer(
  //         text: forecast.forecast.forecastday[0].hour[18].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[18].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[18].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[18].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[18].condition.text,           
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[19].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[19].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[19].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[19].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[19].condition.text,           
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[20].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[20].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[20].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[20].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[20].condition.text,       
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[21].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[21].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[21].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[21].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[21].condition.text,            
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[22].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[22].tempC,
  //           temp_in_fahr: forecast.forecastday[0].hour[22].tempF,
  //           WeatherIcon: forecast.forecastday[0].hour[22].condition.icon,    
  //           descriptiontext:  forecast.forecastday[0].hour[22].condition.text,     
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[0].hour[23].time,     //6
  //           temp_in_celc: forecast.forecast.forecastday[0].hour[23].tempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].hour[23].tempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].hour[23].condition.icon,    
  //           descriptiontext:  forecast.forecast.forecastday[0].hour[23].condition.text,           
  //         ),
  //   ];

  //   final List<Smallcontainer> forecastContainers= [
  //     Smallcontainer(
  //           text: forecast.forecast.forecastday[0].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[0].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[0].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[0].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[0].day.condition.text,        
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[1].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[1].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[1].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[1].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[1].day.condition.text,      
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[2].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[2].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[2].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[2].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[2].day.condition.text,      
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[3].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[3].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[3].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[3].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[3].day.condition.text,    
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[4].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[4].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[4].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[4].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[4].day.condition.text,       
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[5].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[5].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[5].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[5].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[5].day.condition.text,      
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[6].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[6].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[6].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[6].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[6].day.condition.text,      
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[7].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[7].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[7].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[7].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[7].day.condition.text,     
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[8].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[8].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[8].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[8].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[8].day.condition.text,    
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[9].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[9].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[9].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[9].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[9].day.condition.text,    
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[10].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[10].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[10].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[10].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[10].day.condition.text,      
  //         ),

  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[11].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[11].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[11].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[11].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[11].day.condition.text,         
  //         ),
  //         Smallcontainer(
  //           text: forecast.forecast.forecastday[12].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[12].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[12].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[12].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[12].day.condition.text,    
  //         ),
  //       Smallcontainer(
  //           text: forecast.forecast.forecastday[13].date,       //1
  //           temp_in_celc: forecast.forecast.forecastday[13].day.maxtempC,
  //           temp_in_fahr: forecast.forecast.forecastday[13].day.maxtempF,
  //           WeatherIcon: forecast.forecast.forecastday[13].day.condition.icon, 
  //           descriptiontext: forecast.forecast.forecastday[13].day.condition.text,      
  //         ),
        
  //   ];
  // }

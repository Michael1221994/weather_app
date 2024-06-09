import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/API/weather.dart';


class ApiService{
   Future<ActualWeatherData> fetch_current_weather(String query) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/current.json').replace(queryParameters: {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,
    });
    final response = await http.get(url, headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});    
    // final response = await http.get(url, headers: {
    //   'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    // });

    if (response.statusCode == 200) {
      return ActualWeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Weather Data: ${response.statusCode}');
    }
  }

  // Future<ActualWeatherData> fetch_forecast(String endpoint) async {
  //   final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
  //   });

  //   if (response.statusCode == 200) {
  //     return ActualWeatherData.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load Forecast Data');
  //   }
  // }

  // Future<Forecast> fetchForecast(String query, {int? days, String? aqi, String? alerts}) async {
  //   final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json').replace(queryParameters:{
  //     'key':'3e717471fb2744edba5183739242905',
  //     'q': query,
  //     'days': days.toString(),
  //     'aqi': aqi,
  //   } );

  //   // final Map<String, String> queryParams = {
  //   //   'key':'3e717471fb2744edba5183739242905',
  //   //   'q': query,
      
  //   // };

  //   // if (days != null) {
  //   //   queryParams['days'] = days.toString();
  //   // }

  //   // if (aqi != null) {
  //   //   queryParams['aqi'] = aqi;
  //   // }

  //   // final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json').replace(queryParameters: queryParams);

  //   final response = await http.get(url,headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     if (data == null) {
  //     throw Exception('Failed to load Forecast Data: Response body is null');
  //   }
  //   return Forecast.fromJson(data);
  //     //return Forecast.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load Forecast Data: ${response.statusCode}');
  //   }
  // }

  Future<Forecast> fetchForecast(String query, {int? days, String? aqi, String? alerts}) async {
    final Map<String, String> queryParameters = {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,
      if (days != null) 'days': days.toString(),
      if (aqi != null) 'aqi': aqi,
      if (alerts != null) 'alerts': alerts,
    };

    final Uri uri = Uri.http('api.weatherapi.com', '/v1/forecast.json', queryParameters);

    try {
      final response = await http.get(uri);
      print('Response status code: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        print(response.request);
        print(response.body);
        final data = json.decode(response.body);
        if (data == null) {
          throw Exception('Failed to load Forecast Data: Response body is null');
        }
        return Forecast.fromJson(data);
      } else {
        throw Exception('Failed to load Forecast Data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load Forecast Data: $e');
    }
  }

//   Future<Forecast> fetchForecast(String query, {int? days, String? aqi, String? alerts}) async {
//     String s= days?.toString() ?? '';
//   final Map<String, String?> queryParameters = {
//     'key': '3e717471fb2744edba5183739242905',
//     'q': query,
//     'days': s,
//     'aqi': aqi,
//     'alerts': alerts,
//   };
//   queryParameters.removeWhere((key, value) => value == null);
//   final Uri uri = Uri.http('api.weatherapi.com', '/v1/forecast.json', queryParameters);

//   try {
//     final response = await http.get(uri);
//     print('Response status code: ${response.statusCode}');
    
//     if (response.statusCode == 200) {
//       print(response.request);
//       print(response.body);
//       final data = json.decode(response.body);
//       if (data == null) {
//         throw Exception('Failed to load Forecast Data: Response body is null');
//       }
//       return Forecast.fromJson(data);
//     } else {
//       throw Exception('Failed to load Forecast Data: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Failed to load Forecast Data: $e');
//   }
// }

  // Future<Alert> fetch_alert(String endpoint) async {
  //   final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
  //   });

  //   if (response.statusCode == 200) {
  //     return Alert.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load weather data');
  //   }
  // }

  Future<Alert> fetchAlert(String query) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/alerts.json').replace(queryParameters: {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,
    });
    
    final response = await http.get(url,headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});

    if (response.statusCode == 200) {
      return Alert.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Alerts Data:  ${response.statusCode}');
    }
  }

  Future<Location> fetch_Location(String query) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/location').replace(queryParameters: {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,});
    final response = await http.get(url,headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});

    if (response.statusCode == 200) {
      return Location.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  Future<Astro> fetch_astronomy(String query) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/astronomy').replace(queryParameters: {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,});
    final response = await http.get(url,headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});

    if (response.statusCode == 200) {
      return Astro.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
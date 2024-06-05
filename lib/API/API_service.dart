import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/API/weather.dart';


class ApiService{
   Future<ActualWeatherData> fetch_current_weather(String query) async {
    final url = Uri.parse(' http://api.weatherapi.com/v1/current.json').replace(queryParameters: {
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

  Future<Forecast> fetchForecast(String query, {int? days, String? dt}) async {
    final Map<String, String> queryParams = {
      'key': '3e717471fb2744edba5183739242905',
      'q': query,
    };

    if (days != null) {
      queryParams['days'] = days.toString();
    }

    if (dt != null) {
      queryParams['dt'] = dt;
    }

    final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json').replace(queryParameters: queryParams);

    final response = await http.get(url,headers: {'Authorization': 'Bearer 3e717471fb2744edba5183739242905',});

    if (response.statusCode == 200) {
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Forecast Data: ${response.statusCode}');
    }
  }

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
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/API/weather.dart';


class ApiService{
   Future<CurrentWeather> fetch_current_weather(String endpoint) async {
    final url = Uri.parse(' http://api.weatherapi.com/v1/$endpoint');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    });

    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Weather Data');
    }
  }

  Future<CurrentWeather> fetch_forecast(String endpoint) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    });

    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Forecast Data');
    }
  }

  Future<CurrentWeather> fetch_alert(String endpoint) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    });

    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<CurrentWeather> fetch_Location(String endpoint) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    });

    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<CurrentWeather> fetch_astronomy(String endpoint) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/$endpoint');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer 3e717471fb2744edba5183739242905',
    });

    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
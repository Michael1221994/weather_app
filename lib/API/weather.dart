

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

double _asDouble(dynamic value) => (value as num).toDouble();


class CurrentWeather {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  CurrentWeather({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      tempC: _asDouble(json['temp_c']),
      tempF: _asDouble(json['temp_f']),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windMph: _asDouble(json['wind_mph']),
      windKph: _asDouble(json['wind_kph']),
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: _asDouble(json['pressure_mb']),
      pressureIn: _asDouble(json['pressure_in']),
      precipMm: _asDouble(json['precip_mm']),
      precipIn: _asDouble(json['precip_in']),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: _asDouble(json['feelslike_c']),
      feelslikeF: _asDouble(json['feelslike_f']),
      visKm: _asDouble(json['vis_km']),
      visMiles: _asDouble(json['vis_miles']),
      uv: _asDouble(json['uv']),
      gustMph: _asDouble(json['gust_mph']),
      gustKph: _asDouble(json['gust_kph']),
    );
  }
}



class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: _asDouble(json['lat']),
      lon: _asDouble(json['lon']),
      tzId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }
}

class Query {
  final String customId;
  final String q;
  final Location location;
  final CurrentWeather current;

  Query({
    required this.customId,
    required this.q,
    required this.location,
    required this.current,
  });

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      customId: json['custom_id'],
      q: json['q'],
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
    );
  }
}

class WeatherData {
  final Query query;

  WeatherData({required this.query});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      query: Query.fromJson(json['query']),
    );
  }
}

class Alert {
  final String headline;
  final String msgtype;
  final String severity;
  final String urgency;
  final String areas;
  final String category;
  final String certainty;
  final String event;
  final String note;
  final String effective;
  final String expires;
  final String desc;
  final String instruction;

  Alert({
    required this.headline,
    required this.msgtype,
    required this.severity,
    required this.urgency,
    required this.areas,
    required this.category,
    required this.certainty,
    required this.event,
    required this.note,
    required this.effective,
    required this.expires,
    required this.desc,
    required this.instruction,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      headline: json['headline'],
      msgtype: json['msgtype'],
      severity: json['severity'],
      urgency: json['urgency'],
      areas: json['areas'],
      category: json['category'],
      certainty: json['certainty'],
      event: json['event'],
      note: json['note'],
      effective: json['effective'],
      expires: json['expires'],
      desc: json['desc'],
      instruction: json['instruction'],
    );
  }
}

class ActualWeatherData {
  final Location location;
  final CurrentWeather current;

  ActualWeatherData({
    required this.location,
    required this.current,
  });

  factory ActualWeatherData.fromJson(Map<String, dynamic> json) {
    return ActualWeatherData(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
    );
  }
}

class IsDay{
  final int day;

  IsDay({
    required this.day,
  });

  factory IsDay.fromJson(Map<String, dynamic> json){
    return IsDay(day: json['is_day']);
  }
}


class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final int avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: _asDouble(json['maxtemp_c']),
      maxtempF: _asDouble(json['maxtemp_f']),
      mintempC: _asDouble(json['mintemp_c']),
      mintempF: _asDouble(json['mintemp_f']),
      avgtempC: _asDouble(json['avgtemp_c']),
      avgtempF: _asDouble(json['avgtemp_f']),
      maxwindMph: _asDouble(json['maxwind_mph']),
      maxwindKph: _asDouble(json['maxwind_kph']),
      totalprecipMm: _asDouble(json['totalprecip_mm']),
      totalprecipIn: _asDouble(json['totalprecip_in']),
      totalsnowCm: _asDouble(json['totalsnow_cm']),
      avgvisKm: _asDouble(json['avgvis_km']),
      avgvisMiles: _asDouble(json['avgvis_miles']),
      avghumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      condition: Condition.fromJson(json['condition']),
      uv: _asDouble(json['uv']),
    );
  }
}

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final double snowCm;
  final int humidity; 
  final int cloud;  
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      timeEpoch: json['time_epoch'],
      time: json['time'],
      tempC: _asDouble(json['temp_c']),
      tempF: _asDouble(json['temp_f']),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windMph: _asDouble(json['wind_mph']),
      windKph: _asDouble(json['wind_kph']),
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: _asDouble(json['pressure_mb']),
      pressureIn: _asDouble(json['pressure_in']),
      precipMm: _asDouble(json['precip_mm']),
      precipIn: _asDouble(json['precip_in']),
      snowCm: _asDouble(json['snow_cm']),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: _asDouble(json['feelslike_c']),
      feelslikeF: _asDouble(json['feelslike_f']),
      windchillC: _asDouble(json['windchill_c']),
      windchillF: _asDouble(json['windchill_f']),
      heatindexC: _asDouble(json['heatindex_c']),
      heatindexF: _asDouble(json['heatindex_f']),
      dewpointC: _asDouble(json['dewpoint_c']),
      dewpointF: _asDouble(json['dewpoint_f']),
      willItRain: json['will_it_rain'],
      chanceOfRain: json['chance_of_rain'],
      willItSnow: json['will_it_snow'],
      chanceOfSnow: json['chance_of_snow'],
      visKm: _asDouble(json['vis_km']),
      visMiles: _asDouble(json['vis_miles']),
      gustMph: _asDouble(json['gust_mph']),
      gustKph: _asDouble(json['gust_kph']),
      uv: _asDouble(json['uv']),
    );
  }
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      moonIllumination: json['moon_illumination'],
      isMoonUp: json['is_moon_up'],
      isSunUp: json['is_sun_up'],
    );
  }
}


class ForecastDay {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var list = json['hour'] as List;
    List<Hour> hourList = list.map((i) => Hour.fromJson(i)).toList();

    return ForecastDay(
      date: json['date'],
      dateEpoch: json['date_epoch'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: hourList,
    );
  }
}

class ForecastData {
  final List<ForecastDay> forecastday;

  ForecastData({required this.forecastday});

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      forecastday: (json['forecastday'] as List)
          .map((e) => ForecastDay.fromJson(e))
          .toList(),
    );
  }
}

class Forecast {
  final Location location;
  final CurrentWeather current;
  final ForecastData forecast;

  Forecast({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
      forecast: ForecastData.fromJson(json['forecast']),
    );

  // factory Forecast.fromJson(Map<String, dynamic> json) {
  //   var list;
  //   if(json['forecast'] == null) {
  //     list=[];
  //   }
  //   list = json['forecastday'] as List;
  //   List<ForecastDay> forecast = list.map((i) => ForecastDay.fromJson(i)).toList();

  //   return Forecast(
  //     location: Location.fromJson(json['location']),
  //     current: CurrentWeather.fromJson(json['current']),
  //     forecast: List<ForecastDay>.from(
  //         json['forecastday'].map((x) => ForecastDay.fromJson(x))),
  //   );
   }
}


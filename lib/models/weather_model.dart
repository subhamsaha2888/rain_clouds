/// WeatherModel, Current, CurrentWeather, Hourly, HourlyWeather, Rain, Daily, DailyWeather, FeelsLike

class WeatherModel {
  final lat;
  final lon;
  final timezone;
  final timezoneOffset;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;

  WeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: Current.fromJson(json['current']),
      hourly: (json['hourly'] as List).map((x) => Hourly.fromJson(x)).toList(),
      daily: (json['daily'] as List).map((x) => Daily.fromJson(x)).toList(),
    );
  }
}

class Current {
  final dt;
  final sunrise;
  final sunset;
  final temp;
  final feelsLike;
  final pressure;
  final humidity;
  final dewPoint;
  final uvi;
  final clouds;
  final visibility;
  final windSpeed;
  final windDeg;
  final windGust;
  final List<CurrentWeather> currentWeather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    required this.currentWeather,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      currentWeather: (json['weather'] as List).map((x) => CurrentWeather.fromJson(x)).toList(),
    );
  }
}

class CurrentWeather {
  final id;
  final main;
  final description;
  final icon;

  CurrentWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }
}

class Hourly {
  final dt;
  final temp;
  final feelsLike;
  final pressure;
  final humidity;
  final dewPoint;
  final uvi;
  final clouds;
  final visibility;
  final windSpeed;
  final windDeg;
  final windGust;
  final List<HourlyWeather> hourlyWeather;
  final pop;
  final Rain? rain;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    required this.hourlyWeather,
    this.pop,
    required this.rain,
  });
  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'],
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['h'
          'umidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      hourlyWeather: (json['weather'] as List).map((x) => HourlyWeather.fromJson(x)).toList(),
      pop: json['pop'],
      rain: json['rain'] != null ? new Rain.fromJson(json['rain'
          '']) : null,
    );
  }
}

class HourlyWeather {
  final id;
  final main;
  final description;
  final icon;

  HourlyWeather({this.id, this.main, this.description, this.icon});

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Rain {
  final h1h;

  Rain({this.h1h});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      h1h: json['1h'] == null ? null : json['1h'],
    );
  }
}

class Daily {
  final dt;
  final sunrise;
  final sunset;
  final moonrise;
  final moonset;
  final moonPhase;
  final temp;
  final FeelsLike feelsLike;
  final pressure;
  final humidity;
  final dewPoint;
  final windSpeed;
  final windDeg;
  final windGust;
  final List<DailyWeather> dailyWeather;
  final clouds;
  final pop;
  final rain;
  final uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    required this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    required this.dailyWeather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
      temp: json['temp'],
      feelsLike: FeelsLike.fromJson(json["feels_like"]),
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      dailyWeather: (json['weather'] as List).map((x) => DailyWeather.fromJson(x)).toList(),
      clouds: json['clouds'],
      pop: json['pop'],
      rain: json['rain'] == null ? null : json['rain'],
      uvi: json['uvi'],
    );
  }
}

class DailyWeather {
  final id;
  final main;
  final description;
  final icon;

  DailyWeather({this.id, this.main, this.description, this.icon});

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class FeelsLike {
  final day;
  final night;
  final eve;
  final morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'],
      night: json['night'],
      eve: json['eve'],
      morn: json['morn'],
    );
  }
}

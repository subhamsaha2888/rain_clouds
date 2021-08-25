import 'package:flutter/material.dart';

Widget getWeatherIcon({required String weatherDescription, required double width, required double height}) {
  switch(weatherDescription) {
    case "Clear":
      {return Image.asset('images/clear.png', width: width, height: height);}
    case "Haze":
      {return Image.asset('images/haze.png', width: width, height: height);}
    case "Clouds":
      {return Image.asset('images/cloudy.png', width: width, height: height);}
    case "Rain":
      {return Image.asset('images/rain.png', width: width, height: height);}
    case "Snow":
      {return Image.asset('images/cloudy.png', width: width, height: height);}
    default: {return Image.asset('images/clear.png', width: width, height: height);}
  }
}
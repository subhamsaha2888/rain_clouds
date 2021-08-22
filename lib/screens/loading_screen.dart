import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/services/open_weather_api.dart';
import 'package:rain_clouds/services/user_location.dart';
import 'package:geocoding/geocoding.dart';

import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future<WeatherModel> forecastObject;

  @override
  void initState() {
    super.initState();
    getLocationWeather();
    // getLocationWeather();
  }

  void getLocationWeather() async {
    UserLocation location = UserLocation();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    Placemark placeDetails = placemarks[0];
    print(placeDetails.name);
    print(placemarks);


    forecastObject = OpenWeatherApi.getCityWeather(
        latitude: location.latitude, longitude: location.longitude);


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(weatherData: forecastObject, place: placeDetails,)));

    // Future.delayed(Duration(seconds: 1), () {
    //   ;
    // });
  }

  // Future<dynamic> getLocationWeather() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //
  //   _latitude = location.latitude;
  //   _longitude = location.longitude;
  //
  //   print(location.latitude);
  //   print(location.longitude);
  //
  //   forecastObject = await OpenWeatherApi.getCityWeather(
  //       latitude: _latitude, longitude: _longitude);
  //
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(weatherData: forecastObject)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Lottie.asset(
          'assets/splash_animation.json',
          width: 250,
          height: 250,
          // frameRate: FrameRate(170),
          // fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

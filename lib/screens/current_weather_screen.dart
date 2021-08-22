import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rain_clouds/models/weather_model.dart';

class CurrentWeatherScreen extends StatefulWidget {
  final Future<WeatherModel> openWeatherApiData;
  final Placemark userLocation;
  const CurrentWeatherScreen({Key? key, required this.openWeatherApiData, required this.userLocation}) : super(key: key);

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<WeatherModel>(
            future: widget.openWeatherApiData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${widget.userLocation.locality}'),
                    Text('${snapshot.data!.current.temp.toStringAsFixed(0)}'),
                    //TODO expanded today details widget here
                    SizedBox(height: 50),
                  ],
                );
              } else {
                return Container(
                  // By default, show a loading spinner.
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
      ),
    );
  }
}

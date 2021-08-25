import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/views/current_address.dart';
import 'package:rain_clouds/views/today_weather_preview.dart';

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
        child: Container(
          child: FutureBuilder<WeatherModel>(
              future: widget.openWeatherApiData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      // CurrentAddress(snapshot: snapshot, userAddress: widget.userLocation),
                      TodayWeatherPreview(snapshot: snapshot),
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
      ),
    );
  }
}

// Text('${widget.userLocation.locality}'),
// Text('${snapshot.data!.current.temp.toStringAsFixed(0)}'),
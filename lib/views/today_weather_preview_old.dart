import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/utils/convert_weather_icon.dart';
import 'package:rain_clouds/utils/date_format.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:rain_clouds/utils/extensions.dart';

class TodayWeatherPreviewOld extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  const TodayWeatherPreviewOld({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateTimeFormat.getFormattedDate(
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current.dt * 1000));
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// City, Country
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.mapPin,
                // color: Colors.white,
                size: 16, //make 16 size later
              ),
              SizedBox(width: 5),
              Text(
                'City, Country',
                style: GoogleFonts.quicksand(
                  fontSize: 20, //make 16 size later
                  // color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                FeatherIcons.chevronDown,
                // color: Colors.white,
                size: 16, //make 16 size later
              ),
            ],
          ),
          SizedBox(height: 20),

          /// Today, DateFormat
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: GoogleFonts.quicksand(
                  fontSize: 24,
                  // color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                // width: 130,
                // height: 32,
                ///here
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$formattedDate',
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    // color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.topEnd,
                children: [
                  GradientText(
                    '${snapshot.data!.current.temp.toStringAsFixed(0)}',
                    gradientDirection: GradientDirection.ttb,
                    style: GoogleFonts.quicksand(
                      fontSize: 150,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                  Positioned(
                    top: 40,
                    left: 160,
                    child: Text(
                      '° C',
                      style: GoogleFonts.quicksand(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 115,
                child: getWeatherIcon(
                    weatherDescription: snapshot.data!.current.currentWeather[0].main,
                    width: 180,
                    height: 180),
              ),
            ],
          ),
          SizedBox(height: 120),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${snapshot.data!.current.currentWeather[0].description.toString().capitalizeFirstOfEach}',
                maxLines: 1,
                softWrap: true,
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  // color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Feels Like ${snapshot.data!.current.feelsLike.toInt()}°',
                style: GoogleFonts.quicksand(
                  fontSize: 15,
                  // color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getUserAddress() async{
    List<Placemark> placemarks =
        await placemarkFromCoordinates(double.parse(snapshot.data!.lat), double.parse(snapshot.data!.lon));

    Placemark userAddress = placemarks[0];
  }
}

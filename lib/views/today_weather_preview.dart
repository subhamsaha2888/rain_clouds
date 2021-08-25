import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain_clouds/components/texts.dart';
import 'package:rain_clouds/constants/colors.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/utils/convert_weather_icon.dart';
import 'package:rain_clouds/utils/extensions.dart';

class TodayWeatherPreview extends StatefulWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  const TodayWeatherPreview({Key? key, required this.snapshot})
      : super(key: key);

  @override
  _TodayWeatherPreviewState createState() => _TodayWeatherPreviewState();
}

class _TodayWeatherPreviewState extends State<TodayWeatherPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              LitColor.gradientPink,
              LitColor.gradientBlue,
            ],
          )),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  UseTexts(
                      textName:
                          '${widget.snapshot.data!.current.temp.toStringAsFixed(0)}',
                      fontSize: 75,
                      textColor: Colors.white),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: UseTexts(textName: '°c', fontSize: 22, textColor: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
              UseTexts(
                  textName:
                      '${widget.snapshot.data!.current.currentWeather[0].description.toString().capitalizeFirstOfEach}',
                  fontSize: 16,
                  textColor: Colors.white),
              SizedBox(height: 2),
              UseTexts(
                  textName:
                      'Feels Like ${widget.snapshot.data!.current.feelsLike.toInt()}°c',
                  fontSize: 12,
                  textColor: Colors.white.withOpacity(0.5)),
              SizedBox(height: 15),
            ],
          ),
          Positioned(
            left: 125,
            bottom: 55,
            child: getWeatherIcon(
                weatherDescription:
                    widget.snapshot.data!.current.currentWeather[0].main,
                width: 140,
                height: 140),
          ),
        ],
      ),
    );
  }
}

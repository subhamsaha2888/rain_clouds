import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rain_clouds/components/texts.dart';
import 'package:rain_clouds/constants/colors.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/views/today_detail_item.dart';

class TodayWeatherDetails extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshotPro;
  const TodayWeatherDetails({Key? key, required this.snapshotPro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: LitColor.lightBox.withOpacity(0.15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UseTexts(textName: 'Today Details', fontSize: 18, textColor: LitColor.darkText),
                Icon(FeatherIcons.chevronDown, color: LitColor.darkText, size: 24,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TodayDetailItem(iconName: FeatherIcons.droplet, itemName: 'Humidity', itemValue: '${snapshotPro.data!.current.humidity.toStringAsFixed(0)} %'),
                  SizedBox(width: 15,),
                  TodayDetailItem(iconName: FeatherIcons.wind, itemName: 'Wind Speed', itemValue: '${snapshotPro.data!.current.windSpeed.toStringAsFixed(1)} km/h'),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TodayDetailItem(iconName: FeatherIcons.cloud, itemName: 'Cloud Cover', itemValue: '${snapshotPro.data!.current.clouds.toStringAsFixed(0)} %'),
                  SizedBox(width: 15,),
                  TodayDetailItem(iconName: FeatherIcons.eye, itemName: 'Visibility', itemValue: '${snapshotPro.data!.current.visibility / 1000} km'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

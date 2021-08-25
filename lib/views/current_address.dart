import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rain_clouds/components/texts.dart';
import 'package:rain_clouds/constants/colors.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/utils/date_format.dart';

class CurrentAddress extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  final Placemark userAddress;
  const CurrentAddress({Key? key, required this.snapshot, required this.userAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedDate = DateTimeFormat.getFormattedDate(
        DateTime.fromMillisecondsSinceEpoch(snapshot.data!.current.dt * 1000));
    return
    Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(FeatherIcons.mapPin, color: LitColor.darkText, size: 32,),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UseTexts(textName: '${userAddress.locality}, ${userAddress.isoCountryCode}', fontSize: 20, textColor: LitColor.darkText),
              UseTexts(textName: '$formattedDate', fontSize: 14, textColor: LitColor.darkText.withOpacity(0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
// Icon(FeatherIcons.mapPin, color: LitColor.darkText, size: 30,),
// UseTexts(textName: '${userAddress.locality}, ${userAddress.country}', fontSize: 22, textColor: LitColor.darkText),
// UseTexts(textName: '$formattedDate', fontSize: 16, textColor: LitColor.darkText.withOpacity(0.5)),
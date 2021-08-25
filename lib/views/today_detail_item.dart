import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain_clouds/components/texts.dart';
import 'package:rain_clouds/constants/colors.dart';

class TodayDetailItem extends StatelessWidget {
  final IconData iconName;
  final String itemName;
  final String itemValue;
  const TodayDetailItem({Key? key, required this.iconName, required this.itemName, required this.itemValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: LitColor.lightBox.withOpacity(0.2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconName,
              size: 22,
              color: LitColor.darkText.withOpacity(0.5),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UseTexts(textName: itemValue, fontSize: 14, textColor: LitColor.darkText),
                // SizedBox(height: 2),
                UseTexts(textName: itemName, fontSize: 10.5, textColor: LitColor.darkText.withOpacity(0.5)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

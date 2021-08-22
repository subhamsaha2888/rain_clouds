import 'package:flutter/material.dart';

class DailyForecastScreen extends StatefulWidget {
  const DailyForecastScreen({Key? key}) : super(key: key);

  @override
  _DailyForecastScreenState createState() => _DailyForecastScreenState();
}

class _DailyForecastScreenState extends State<DailyForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Daily Forecast Screen')),
    );
  }
}

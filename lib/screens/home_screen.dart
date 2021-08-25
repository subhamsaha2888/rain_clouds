import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rain_clouds/constants/colors.dart';
import 'package:rain_clouds/models/weather_model.dart';
import 'package:rain_clouds/screens/search_screen.dart';
import 'package:rain_clouds/screens/settings_screen.dart';

import 'current_weather_screen.dart';
import 'daily_forecast_screen.dart';

class HomeScreen extends StatefulWidget {
  final Future<WeatherModel> weatherData;
  final Placemark place;
  const HomeScreen({Key? key, required this.weatherData, required this.place})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0; //selected index of the bottom nav bar
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          CurrentWeatherScreen(openWeatherApiData: widget.weatherData, userLocation: widget.place),
          DailyForecastScreen(),
          SearchScreen(),
          SettingsScreen(),
        ],
        onPageChanged: (index) {
          onPageChange(index);
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Colors.blueGrey.shade900,
          // Theme.of(context).bottomAppBarColor
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2.0,
              offset: Offset(0, -4),
              color: Colors.grey.withOpacity(0.05),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            child: GNav(
              color: Colors.blueGrey.shade300, ///Inactive Icon Color
              // Theme.of(context).disabledColor
              // Colors.white.withOpacity(0.3)
              rippleColor: Colors.transparent,
              hoverColor: Theme.of(context).hoverColor,
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              gap: 8,
              iconSize: 28,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              duration: const Duration(milliseconds: 450),
              curve : Curves.bounceIn,

              tabs: [
                GButton(
                  icon: FeatherIcons.home,
                  iconActiveColor: LitColor.home,
                  text: 'Home',
                  textColor: LitColor.home,
                  backgroundColor: LitColor.home.withOpacity(0.1),
                ),
                GButton(
                  icon: FeatherIcons.mapPin,
                  iconActiveColor: LitColor.icons,
                  text: 'Forecast',
                  textColor: LitColor.icons,
                  backgroundColor: LitColor.icons.withOpacity(0.1),
                ),
                GButton(
                  icon: FeatherIcons.search,
                  iconActiveColor: LitColor.walls,
                  text: 'Search',
                  textColor: LitColor.walls,
                  backgroundColor: LitColor.walls.withOpacity(0.1),
                ),
                GButton(
                  icon: FeatherIcons.settings,
                  iconActiveColor: LitColor.widgets,
                  text: 'Settings',
                  textColor: LitColor.widgets,
                  backgroundColor: LitColor.widgets.withOpacity(0.1),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                onTabChange(index);
              },
            ),
          ),
        ),
      ),
    );
  }
  void onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }
}

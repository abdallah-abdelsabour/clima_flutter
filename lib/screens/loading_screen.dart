import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    //   getWeatherData();

    // TODO: implement initState
    super.initState();
    print("start");

    getWeatherData();
  }

  getWeatherData() async {
    UserLocation _userLocation = UserLocation();

    await _userLocation.getlocation();

    String key = '50f4c55512ae08e6339018cfd92901dd';

    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${_userLocation.latitude}&lon=${_userLocation.longtude}&appid=${key}&units=metric";


    NetworkHelper networkHelper = NetworkHelper(url);

    var response = await networkHelper.getWeatherData();

    var data = jsonDecode(response);

    

    print("processs finished ");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData:data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

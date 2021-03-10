import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  var weatherData;

  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  double temp;

  String city;
  String tempIcons;
  String message;
  String typedCity;
  @override
  void initState() {
    super.initState();

    if (typedCity != null) {
      print("iam here in in fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffint ");

     widget.weatherData= updatebyName();
    }
      
      uodateUi(widget.weatherData);
    
  }

  updatebyName() async {
    final helper = NetworkHelper("_");

    return await helper.getWeatherMyName(typedCity);
  }

  void uodateUi(data) {
    var id = data['weather'][0]['id'];

    temp = data['main']['temp'];

    city = data['name'];
    tempIcons = weather.getWeatherIcon(id);

    message = weather.getMessage(temp.toInt());

    print(id);
    print(temp);
    print(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        uodateUi(widget.weatherData);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                     this.typedCity = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temp.toInt()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$tempIcons',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $city',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

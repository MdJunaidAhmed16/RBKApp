import 'package:flutter/material.dart';
import 'package:open_weather_widget/open_weather_widget.dart';

class Weather extends StatelessWidget {
  Weather({Key? key}) : super(key: key);
  String apiKey = "378fd4e950bba4a2cs12734b760d69afe";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OpenWeatherWidget(
        temperatureColor: Colors.red,
        locationColor: Colors.black,
        width: 200,
        color: Colors.red,
        latitude: 22.550460,
        longitude: 88.347311,
        location: "Kolkata",
        height: 200,
        apiKey: apiKey,
        alignment: MainAxisAlignment.center,
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

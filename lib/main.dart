import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/services.dart';
import 'package:weather/views/add.dart';
import 'package:weather/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("Kodaikanal");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0099ff),
      appBar: AppBar(
        backgroundColor: const Color(0xff0099ff),
        elevation: 0.0,
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°", "${data!.cityName}"),
                SizedBox(
                    height: 50.0
                ),
                Text("Additional Information",
                  style: TextStyle(color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                add("${data!.wind}Km/h", "${data!.pressure} Pa", "${data!.humidity}", "${data!.Feels_like}"),
              ],
            );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
      },
      )
    );
  }
}

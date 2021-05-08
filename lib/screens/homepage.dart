import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/services/weather_service.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherService _WeatherService = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Weather App'),
      ),
      body: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: _WeatherService.getWeather(city_name: 'padang') ,
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      child: Image(
                        image: NetworkImage('https://openweathermap.org/img/wn/'+snapshot.data.weather[0].icon+'@2x.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(snapshot.data.weather[0].main,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(snapshot.data.weather[0].description,
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Temperature', style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(snapshot.data.main.temp.toString()+' Kelvin',
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Humidity', style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(snapshot.data.main.humidity.toString()+' %',
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text('Wind Speed', style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(snapshot.data.wind.speed.toString()+' m/s',
                      style: TextStyle(
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

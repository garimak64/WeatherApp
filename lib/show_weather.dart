import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/weather_bloc.dart';
import 'package:flutterweather/weather_model.dart';

class ShowWeather extends StatefulWidget {
  final PageController _pageController;

  ShowWeather(this._pageController);

  @override
  _ShowWeatherState createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  WeatherBloc _weatherBloc;

  @override
  Widget build(BuildContext context) {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      backgroundColor: Colors.indigo,

      body: Container(
          padding: EdgeInsets.only(right: 32, left: 32, top: 10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:250.0, top: 20),
                child: IconButton(icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      _weatherBloc.add(ResetWeather());
                      widget._pageController.previousPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.linear);}),
              ),

              BlocBuilder<WeatherBloc, WeatherState>(
                  bloc: _weatherBloc,
                  builder: (context, state) {
                    if (state is WeatherIsLoaded) {
                      WeatherModel weatherUpdate =
                          (state.props[0] as WeatherModel);
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text(
                              state.getWeather.city,
                              style: TextStyle(fontSize: 40.0, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.cloud,
                          color: Colors.white,
                          size: 150,),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Temp: "+ weatherUpdate.temp.toString() +" K",
                              style:
                                  TextStyle(fontSize: 30.0, color: Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Humidity: "+ weatherUpdate.humidity.toString(),
                              style:
                                  TextStyle(fontSize: 30.0, color: Colors.white)),
                          SizedBox(
                            height: 20,
                          ),

                          Text("Max Temp "+weatherUpdate.temp_max.toString() +" K",
                              style:
                                  TextStyle(fontSize: 25.0, color: Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Min Temp "+ weatherUpdate.temp_min.toString() +" K",
                              style:
                                  TextStyle(fontSize: 25.0, color: Colors.white)),

                        ],
                      );
                    } else {
                      return Text("");
                    }
                  }),
            ],
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

//Text(
//city,
//style: TextStyle(
//color: Colors.white70,
//fontSize: 30,
//fontWeight: FontWeight.bold),
//),
//SizedBox(
//height: 10,
//),
//Text(
//weather.getTemp.round().toString() + "C",
//style: TextStyle(color: Colors.white70, fontSize: 50),
//),
//Text(
//"Temprature",
//style: TextStyle(color: Colors.white70, fontSize: 14),
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Column(
//children: <Widget>[
//Text(
//weather.getMinTemp.round().toString() + "C",
//style: TextStyle(color: Colors.white70, fontSize: 30),
//),
//Text(
//"Min Temprature",
//style: TextStyle(color: Colors.white70, fontSize: 14),
//),
//],
//),
//Column(
//children: <Widget>[
//Text(
//weather.getMaxTemp.round().toString() + "C",
//style: TextStyle(color: Colors.white70, fontSize: 30),
//),
//Text(
//"Max Temprature",
//style: TextStyle(color: Colors.white70, fontSize: 14),
//),
//],
//),
//],
//),
//SizedBox(
//height: 20,
//),
//Container(
//width: double.infinity,
//height: 50,
//child: FlatButton(
//shape: new RoundedRectangleBorder(
//borderRadius: BorderRadius.all(Radius.circular(10))),
//onPressed: () {
//BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
//},
//color: Colors.lightBlue,
//child: Text(
//"Search",
//style: TextStyle(color: Colors.white70, fontSize: 16),
//),
//),
//)

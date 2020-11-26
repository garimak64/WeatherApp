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

    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            BlocBuilder<WeatherBloc, WeatherState>(
                bloc: _weatherBloc,
                builder: (context, state) {
                  if (state is WeatherIsLoaded) {
                    WeatherModel weatherUpdate =
                        (state.props[0] as WeatherModel);
                    return Column(
                      children: <Widget>[
                        Text(
                          state.getWeather.city,
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        Text(weatherUpdate.temp.toString(),
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.white)),
                        Text(weatherUpdate.humidity.toString(),
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.white)),
                        Text(weatherUpdate.temp_max.toString(),
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.white)),
                        Text(weatherUpdate.temp_min.toString(),
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.white)),
                        RaisedButton(
                          child: Text("Bakc"),
                          onPressed: () => widget._pageController.previousPage(
                              duration: Duration(milliseconds: 250),
                              curve: Curves.linear),
                        )
                      ],
                    );
                  } else {
                    return Text("Error");
                  }
                }),
          ],
        ));
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

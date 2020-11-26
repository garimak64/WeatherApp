import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/search_page.dart';
import 'package:flutterweather/show_weather.dart';
import 'package:flutterweather/weather_bloc.dart';
import 'package:flutterweather/weather_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(WeatherRepo()), child: MyHome()),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Weather App"),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            new Center(child: SearchPage(_pageController)),
            new Center(child: ShowWeather(_pageController)),
          ],
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: (num) {}),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
}

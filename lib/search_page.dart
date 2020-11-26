import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/weather_bloc.dart';


class SearchPage extends StatefulWidget {
  final PageController _pageController;

  SearchPage(this._pageController);


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<String> cities = ["Ahmedabad","Delhi","Mumbai","Hyderabad","Kolkata"];

  static Image aImage = Image.asset("assets/images/ahmedabad.jpeg",);
  static Image dImage = Image.asset("assets/images/delhi.jpeg",);
  static Image mImage = Image.asset("assets/images/mumbai.jpeg",);
  static Image hImage = Image.asset("assets/images/hyderabad.jpeg",);
  static Image kImage = Image.asset("assets/images/kolkata.jpeg",);
  List<Image> images = [aImage,dImage,mImage,hImage,kImage];
  WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIsNotSearched)
              return Expanded(child: getListView());
            else if (state is WeatherIsLoading)
              return Center(child: CircularProgressIndicator());
            else if (state is WeatherIsLoaded)
              return NextPage(widget._pageController);
            else
              return Text(
                "Error",
                style: TextStyle(color: Colors.white),
              );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }



  ListView getListView()
  {
     return ListView.builder(
       scrollDirection: Axis.vertical,
       shrinkWrap: true,
       itemCount: cities.length,
       itemBuilder: (context, index) {
         return Padding(
           padding: const EdgeInsets.only(left:18.0,right: 20,top: 15),
           child: Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0),
             ),
             elevation: 20,
             child: Container(

               height: 150,
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       colors: [Colors.green, Colors.blue]),

                   borderRadius: BorderRadius.all(Radius.circular(15)),

               ),
               child: ListTile(

                 title: Center(
                   child: Text(cities[index],
                   style: TextStyle(
                     fontSize: 30,
                     color: Colors.white
                   ),),
                 ),
                 onTap: ()=>  weatherBloc.add(FetchWeather(cities[index])),
               ),
             ),
           ),
         );
       },

     );
  }

  Container getContainer(TextEditingController cityController)
  {
     return Container(
       padding: EdgeInsets.only(
         left: 32,
         right: 32,
       ),
       child: Column(
         children: <Widget>[
           Container(
             height: 150,
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               elevation: 20,
               color: Colors.pink,
               child: ListTile(
                 leading: Padding(
                   padding: const EdgeInsets.only(top:15.0),
                   child: Icon(Icons.local_airport, size: 50,
                   color: Colors.white,),
                 ),
                 title: Padding(
                   padding: const EdgeInsets.only(top:30.0),
                   child: Text('Mumbai', style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 40,
                     color: Colors.white
                   ),),
                 ),
                 onTap: ()=>  weatherBloc.add(FetchWeather("Mumbai")),
               ),
             ),
           ),


           SizedBox(
             height: 24,
           ),

           Container(
             height: 150,
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               elevation: 20,
               color: Colors.green,
               child: ListTile(
                 leading: Padding(
                   padding: const EdgeInsets.only(top:15.0),
                   child: Icon(Icons.favorite, size: 50,
                     color: Colors.white,),
                 ),
                 title: Padding(
                   padding: const EdgeInsets.only(top:30.0),
                   child: Text('Ahmedabad', style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 35,
                       color: Colors.white
                   ),),
                 ),
                 onTap: ()=>  weatherBloc.add(FetchWeather("Ahmedabad")),
               ),
             ),
           ),

           SizedBox(
             height: 24,
           ),

           Container(
             height: 150,
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               elevation: 20,
               color: Colors.deepPurple,
               child: ListTile(
                 leading: Padding(
                   padding: const EdgeInsets.only(top:15.0),
                   child: Icon(Icons.insert_emoticon, size: 50,
                     color: Colors.white,),
                 ),
                 title: Padding(
                   padding: const EdgeInsets.only(top:30.0),
                   child: Text('Delhi', style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 35,
                       color: Colors.white
                   ),),
                 ),
                 onTap: ()=>  weatherBloc.add(FetchWeather("Delhi")),
               ),
             ),
           ),

           SizedBox(
             height: 24,
           ),


//           TextFormField(
//             controller: cityController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Colors.white70,
//               ),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(
//                       color: Colors.white70,
//                       style: BorderStyle.solid)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(
//                       color: Colors.blue, style: BorderStyle.solid)),
//               hintText: "City Name",
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//             style: TextStyle(color: Colors.white70),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             width: double.infinity,
//             height: 50,
//             child: FlatButton(
//               shape: new RoundedRectangleBorder(
//                   borderRadius:
//                   BorderRadius.all(Radius.circular(10))),
//               onPressed: () {
//                 weatherBloc.add(FetchWeather(cityController.text));
//               },
//               color: Colors.lightBlue,
//               child: Text(
//                 "Search",
//                 style: TextStyle(color: Colors.white70, fontSize: 16),
//               ),
//             ),
//           )
         ],
       ),
     );
  }

  Widget _myListView(BuildContext context, TextEditingController cityController) {

    final titles = ['bike', 'boat', 'bus', 'car',
      'railway', 'run', 'subway', 'transit', 'walk'];

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card( //                           <-- Card widget
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
            onTap:()=>  weatherBloc.add(FetchWeather(cityController.text)),
          ),
        );
      },
    );
  }

}

class NextPage extends StatelessWidget {

  final PageController _pageController;


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  NextPage(this._pageController){
    _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.linear);
  }
}


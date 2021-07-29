import 'package:flutter/cupertino.dart';
import 'package:peliculas/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomeScreen(),
    'details': (BuildContext context) => DetailsScreen()
  };
}
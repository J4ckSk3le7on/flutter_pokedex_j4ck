import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pokedex_j4ck/pages/home_page/ui/home_page.dart';
import 'package:flutter_pokedex_j4ck/pages/pokedex_page/ui/pokedex_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "home_page",
      routes: {
        "home_page"     : (BuildContext context) => HomePage(),
        "pokedex_page"  : (BuildContext context) => PokedexPage()
      },
    );
  }
}


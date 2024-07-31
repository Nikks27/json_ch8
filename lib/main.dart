import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/provider/Language_Provider.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/view/slockscreen.dart';
import 'package:provider/provider.dart';
import '8.3_Json Data Parsing/Provider/8.3_Provider.dart';
import '8.3_Json Data Parsing/View/8.3_View.dart';
import 'Bhagwat geeta/screen/provider/Details_provider.dart';
import 'Bhagwat geeta/screen/provider/geetaprovider.dart';
import 'Bhagwat geeta/screen/view/SplashScreen.dart';
import 'Bhagwat geeta/screen/view/geeta_screen.dart';
import 'Bhagwat geeta/screen/view/single_verses.dart';
import 'Json Parsing 2/Screen/Provider/JsonParsingProvider.dar.dart';
import 'Pixabay/Screens/View/Pixabay_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) =>  SearchScreen(),
        },
      ),
    );
  }
}
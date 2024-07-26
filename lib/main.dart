import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/provider/Language_Provider.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/view/slockscreen.dart';
import 'package:provider/provider.dart';
import 'Bhagwat geeta/screen/provider/Details_provider.dart';
import 'Bhagwat geeta/screen/provider/geetaprovider.dart';
import 'Bhagwat geeta/screen/view/SplashScreen.dart';
import 'Bhagwat geeta/screen/view/geeta_screen.dart';
import 'Bhagwat geeta/screen/view/single_verses.dart';
import 'Json Parsing 2/Screen/Provider/JsonParsingProvider.dar.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => GeetaProvider(),),
        ChangeNotifierProvider(create: (context) => DetailProvider(),),
        ChangeNotifierProvider(create: (context) => LangugeProvider(),),
      ],
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:
            {
          '/' : (context) => SplashScreen(),
          '/18Adhyay' : (context) => geetapage(),
           '/user' : (context) => slockscreen(),
           // '/single' : (context) => SingleVerses(),
        },
      ),
    );
  }
}

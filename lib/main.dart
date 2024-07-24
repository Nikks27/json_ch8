import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/view/slockscreen.dart';
import 'package:provider/provider.dart';
import 'Bhagwat geeta/screen/provider/geetaprovider.dart';
import 'Bhagwat geeta/screen/view/geeta_screen.dart';
import 'Json Parsing 2/Screen/Provider/JsonParsingProvider.dar.dart';
import 'Json Parsing 2/Screen/View/JsonParsing2View.dart';

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
      ],
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:
            {
          '/' : (context) => const geetapage(),
           '/user' : (context) => slockscreen(),

        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '8.1 What is JSON & JSON Parsing/Screens/View/JsonView.dart';
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
        // ChangeNotifierProvider(create: (context) => HomeProvider(),),
        // ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:
        {
          '/' : (context) => UserPage(),
          '/home' :(context) => HomePage(),
        },
      ),
    );
  }
}

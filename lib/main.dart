import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Recipe_App/Screens/Provider/Recipe_Provider.dart';
import 'Recipe_App/Screens/View/DetailsScreen.dart';
import 'Recipe_App/Screens/View/HomePage.dart';
import 'Recipe_App/Screens/View/SplashScreen.dart';


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
        ChangeNotifierProvider(create: (context) => RecipesProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashScreen(),
          '/home' : (context) => HomeScreen(),
          '/detail' : (context) => DetailScreen(),
        },
      ),
    );
  }
}
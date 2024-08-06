
import 'dart:async';
import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushNamed('/home');
    } );
    return Scaffold(
        body:Center(

          child: Container(
            height:400,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/food_logo_4-removebg-preview.png'
                    )
                )
            ),
          ),
        )
    );
  }
}
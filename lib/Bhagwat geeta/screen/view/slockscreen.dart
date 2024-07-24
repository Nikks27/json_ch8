import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/view/geeta_screen.dart';
import 'package:provider/provider.dart';

import '../provider/geetaprovider.dart';


class slockscreen extends StatelessWidget {
  const slockscreen({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);
    return Scaffold(
      body: ListView.builder( itemCount: geetaProvider.geetaData.length,itemBuilder: (context, index) => Card(child: ListTile(
        title: Text(geetaProvider.geetaData[selectindex].Verse[index].language.sanskrit),

      ),),)

    );
  }
 }

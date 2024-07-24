import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/provider/geetaprovider.dart';
import 'package:provider/provider.dart';

class geetapage extends StatelessWidget {
  const geetapage({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        centerTitle: true,
        title: Text(
          'geeta',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 3,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: geetaProvider.geetaData.length,
        itemBuilder: (context, index) => InkWell(onTap: () {

    selectindex=index;
    Navigator.of(context).pushNamed('/user');

    },
    child: Card(
          color: Colors.grey.shade800,
          child: ListTile(
            leading: Text(
              geetaProvider.geetaData[index].chapterName.sanskrit,
              style: TextStyle(color: Colors.white),
            ),
            title: Text(geetaProvider.geetaData[index].Chapter.toString(),
                  style: TextStyle(color: Colors.white)),
            ),

          ),
        ),
      )
    );
  }
}
int selectindex=0;

import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/provider/geetaprovider.dart';
import 'package:provider/provider.dart';

import '../provider/Details_provider.dart';
import '../utils/global.dart';

class geetapage extends StatelessWidget {
  const geetapage({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);

    DetailProvider detailProvidertrue = Provider.of(context, listen: true);
    DetailProvider detailProviderfalse = Provider.of(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        centerTitle: true,
        title: Text(
          (detailProvidertrue.selectedLanguage == 'Sanskrit')
              ? translate[0]
              : (detailProvidertrue.selectedLanguage == 'Hindi')
              ? translate[1]
              : (detailProvidertrue.selectedLanguage == 'English')
              ? translate[2]
              : translate[3],
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownButton(
            value: detailProvidertrue.selectedLanguage,
            onChanged: (String? value) {
              detailProviderfalse.languageTranslate(value!);
            },
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/backgroundimage.jpg'
            ),
            fit: BoxFit.cover,
          )
        ),
        child: ListView.builder(
          itemCount: geetaProvider.geetaData.length,
          itemBuilder: (context, index) => InkWell(onTap: () {
            selectindex=index;
            Navigator.of(context).pushNamed('/user');
            },
            child: Card(
            // color: Colors.grey.shade800,
            child: ListTile(
              leading: Text(
                geetaProvider.geetaData[index].Chapter.toString(),
                style: TextStyle(fontSize: 17),
              ),
              title: Text(  (detailProvidertrue.selectedLanguage == 'Sanskrit')
                  ? geetaProvider.geetaData[index].chapterName.sanskrit
                  : (detailProvidertrue.selectedLanguage == 'Hindi')
                  ? geetaProvider.geetaData[index].chapterName.hindi
                  : (detailProvidertrue.selectedLanguage ==
                  'English')
                  ? geetaProvider
                  .geetaData[index].chapterName.english
                  : geetaProvider
                  .geetaData[index].chapterName.gujarati,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
              ),
            ),
          ),
        ),
      )
    );
  }
}

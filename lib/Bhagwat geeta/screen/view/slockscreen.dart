import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_ch8/Bhagwat%20geeta/screen/view/single_verses.dart';
import 'package:provider/provider.dart';
import '../provider/Details_provider.dart';
import '../provider/geetaprovider.dart';
import '../utils/global.dart';

class slockscreen extends StatelessWidget {
  const slockscreen({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);

    DetailProvider detailProvidertrue = Provider.of(context, listen: true);
    DetailProvider detailProviderfalse = Provider.of(context, listen: false);
    return Scaffold(
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
              'assets/images/backgroundimage.jpg',

            ),
            fit: BoxFit.cover,
          )
        ),
        child: ListView.builder(
          itemCount: geetaProvider.geetaData.length,
          itemBuilder: (context,index)=> Card(
            margin: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                selectedverses = index;
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SingleVerses(),));
              },
              child: ListTile(
                title: Text(
                  (detailProvidertrue.selectedLanguage == 'Sanskrit')
                      ? geetaProvider.geetaData[selectindex].Verse[index]
                      .language.sanskrit
                      : (detailProvidertrue.selectedLanguage == 'Hindi')
                      ? geetaProvider.geetaData[selectindex]
                      .Verse[index].language.hindi
                      : (detailProvidertrue.selectedLanguage ==
                      'English')
                      ? geetaProvider.geetaData[selectindex]
                      .Verse[index].language.english
                      : geetaProvider.geetaData[selectindex]
                      .Verse[index].language.gujarati,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ),
      )
    );
  }
}


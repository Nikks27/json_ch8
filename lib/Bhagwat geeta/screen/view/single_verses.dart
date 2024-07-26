
import 'dart:io';
import 'dart:math';

import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';
import '../provider/Details_provider.dart';
import '../provider/geetaprovider.dart';
import 'package:flutter/services.dart';
import '../utils/global.dart';

Random random = Random();
int n = random.nextInt(ImageList.length);
GlobalKey editImage = GlobalKey();

class SingleVerses extends StatelessWidget {
  const SingleVerses({super.key});

  @override
  Widget build(BuildContext context) {
    GeetaProvider geetaProvider = Provider.of<GeetaProvider>(context);

    DetailProvider detailProvidertrue = Provider.of(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('verse',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: editImage,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      height: 615,
                      width: 330,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: AssetImage(ImageList[selectindex]),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                          ),
                          Text(
                            (detailProvidertrue.selectedLanguage == 'Sanskrit')
                                ?geetaProvider.geetaData[selectindex]
                                .chapterName.sanskrit
                                : (detailProvidertrue.selectedLanguage ==
                                'Hindi')
                                ? geetaProvider.geetaData[selectindex]
                                .chapterName.hindi
                                : (detailProvidertrue.selectedLanguage ==
                                'English')
                                ? GeetaProvider()
                                .geetaData[selectindex]
                                .chapterName
                                .english
                                : geetaProvider.geetaData[selectindex]
                                .chapterName.gujarati,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (detailProvidertrue.selectedLanguage == 'Sanskrit')
                                ? geetaProvider.geetaData[selectindex]
                                .Verse[selectedverses].language.sanskrit
                                : (detailProvidertrue.selectedLanguage ==
                                'Hindi')
                                ? geetaProvider.geetaData[selectindex]
                                .Verse[selectedverses].language.hindi
                                : (detailProvidertrue.selectedLanguage ==
                                'English')
                                ? geetaProvider
                                .geetaData[selectindex]
                                .Verse[selectedverses]
                                .language.english
                                : geetaProvider
                                .geetaData[selectindex]
                                .Verse[selectedverses]
                                .language
                                .gujarati,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  boxcat(
                    InkWell(
                      onTap: () async {
                        RenderRepaintBoundary boundary =
                        editImage.currentContext!.findRenderObject()
                        as RenderRepaintBoundary;
                        ui.Image image = await boundary.toImage();
                        ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
                        Uint8List img = bytedata!.buffer.asUint8List();
                        final path = await getApplicationDocumentsDirectory();
                        File file = File("${path.path}/img.png");
                        file.writeAsBytes(img);
                        ShareExtend.share(file.path, "image");
                      },
                      child: Icon(
                        Icons.share,
                        size: 24,
                      ),
                    ),
                    'Share',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  boxcat(
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.teal.shade50,
                              title: Text(
                                'Do you want to Set Wallpaper ?',
                                style: TextStyle(),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                TextButton(
                                    onPressed: () async {
                                      RenderRepaintBoundary boundary =
                                      editImage.currentContext!
                                          .findRenderObject()
                                      as RenderRepaintBoundary;
                                      ui.Image image = await boundary.toImage();
                                      ByteData? bytedata =
                                      await image.toByteData(format: ui.ImageByteFormat.png);
                                      Uint8List img =
                                      bytedata!.buffer.asUint8List();
                                      final path =
                                      await getApplicationDocumentsDirectory();
                                      File file = File("${path.path}/img.png");
                                      file.writeAsBytes(img);
                                      ShareExtend.share(file.path, "image");
                                      int location = WallpaperManager
                                          .BOTH_SCREEN; //can be Home/Lock Screen
                                      bool result = await WallpaperManager
                                          .setWallpaperFromFile(
                                          file.path, location);
                                      Navigator.pop(context);
                                      //
                                    },
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.wallpaper,
                        size: 24,
                      ),
                    ),
                    'Wallpaper',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  boxcat(
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.teal.shade50,
                              title: Text(
                                'Do you want to Save ?',
                                style: TextStyle(color: Colors.black),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Back',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                TextButton(
                                    onPressed: () async {
                                      RenderRepaintBoundary boundary =
                                      editImage.currentContext!
                                          .findRenderObject()
                                      as RenderRepaintBoundary;

                                      ui.Image image = await boundary.toImage();
                                      ByteData? bytedata =
                                      await image.toByteData(
                                          format: ui.ImageByteFormat.png);
                                      Uint8List img =
                                      bytedata!.buffer.asUint8List();
                                      ImageGallerySaver.saveImage(img);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.file_download_outlined,
                        size: 24,
                      ),
                    ),
                    'Save',
                  ),
                ],
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Column boxcat(
    i1,
    String name,
    ) {
  return Column(
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: i1,
      ),
      Text(name)
    ],
  );
}



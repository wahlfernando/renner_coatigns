import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class TileItem extends Container {
  TileItem({required String textTile, String? urlFile})
      : super(
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.2, color: kGrey),
          ),
          padding: urlFile != null ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textTile,
                  style: font14Bold,
                ),
                urlFile != null
                    ? TextButton(
                        onPressed: () async {
                          Directory? directory = await getExternalStorageDirectory();
                          String nameFile = urlFile.split("/")[7];

                          var status = await Permission.storage.status;

                          if (status.isDenied) {
                            Permission.storage.request();
                          }
                          if (status.isGranted) {
                            Get.rawSnackbar(
                                messageText: Center(child: Text("Download Iniciado", style: TextStyle(color: kRed, fontWeight: FontWeight.w700))),
                                backgroundColor: HexColor("EFEFEF"),
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                showProgressIndicator: true,
                                progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(HexColor("f29699")),
                                progressIndicatorBackgroundColor: kRed,
                                duration: Duration(seconds: 2));
                            Dio().download(urlFile, "${directory!.path}/$nameFile").then((value) {
                              Get.rawSnackbar(
                                messageText: Center(child: Text("Download Finalizado", style: TextStyle(color: kRed, fontWeight: FontWeight.w700))),
                                backgroundColor: HexColor("EFEFEF"),
                                duration: Duration(seconds: 4),
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                                mainButton: Center(
                                  child: Material(
                                    color: HexColor("EFEFEF"),
                                    child: Ink(
                                      width: 40,
                                      height: 30,
                                      child: InkWell(
                                        onTap: () => OpenFile.open("${directory.path}/$nameFile", type: "application/pdf"),
                                        child: Center(
                                          child: Text(
                                            "Abrir",
                                            style: TextStyle(color: kRed, fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(1, 1),
                        ),
                        child: Icon(
                          FontAwesomeIcons.download,
                          color: HexColor("58585A"),
                          size: 19,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
}

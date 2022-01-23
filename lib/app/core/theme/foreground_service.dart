//
// import 'package:flutter_foreground_plugin/flutter_foreground_plugin.dart';
// import 'package:flutter/material.dart';
//
//
// void startForegroundService() async {
//   await FlutterForegroundPlugin.setServiceMethodInterval(seconds: 5);
//   await FlutterForegroundPlugin.setServiceMethod(globalForegroundService);
//   await FlutterForegroundPlugin.startForegroundService(
//     holdWakeLock: false,
//     onStarted: () {
//       print("Started");
//     },
//     onStopped: () {
//       print("Stopped");
//     },
//     title: "Renner Coatings",
//     content: "",
//     iconName: "assets/icons/icone.png",
//   );
// }
//
// void globalForegroundService() {
//   debugPrint("Hora agpra: ${DateTime.now()}");
// }
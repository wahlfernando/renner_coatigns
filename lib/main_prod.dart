import 'dart:async';
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/core/settings/settings.dart';
import 'app/core/theme/foreground_service.dart';
import 'app/core/translations/app_translations.dart';
import 'app/routes/app_pages.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  var taskId = task.taskId;
  var timeout = task.timeout;
  if (timeout) {
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }

  print("[BackgroundFetch] Headless event received: $taskId");

  var timestamp = DateTime.now();

  if (taskId == 'flutter_background_fetch') {
    print(timestamp);
  }
  BackgroundFetch.finish(taskId);
}

Future<void> main() async {
  Settings.buildMode = Modo.PROD;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Renner Coatings",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    ),
  );

  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

}


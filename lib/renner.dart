
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/routes/app_pages.dart';

List<String> processedDoseScheduleGuids = [];

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class RennerCoatingsApp extends StatefulWidget {
  @override
  _RennerCoatingsAppState createState() => _RennerCoatingsAppState();
}

class _RennerCoatingsAppState extends State<RennerCoatingsApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Renner Coatings",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    );
  }
}

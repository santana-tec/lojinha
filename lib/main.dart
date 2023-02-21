import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lojinha/src/pages_routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lojinha',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      initialRoute: PageRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}

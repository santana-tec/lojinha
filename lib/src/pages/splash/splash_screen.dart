import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lojinha/src/config/custom_colors.dart';
import 'package:lojinha/src/pages/common_widgets/app_name_widget.dart';
import 'package:lojinha/src/pages_routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PageRoutes.signInRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSawtchColor,
              CustomColors.customSawtchColor.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              greenTitileColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

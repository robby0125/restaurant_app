import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/common/resources.dart';
import 'package:restaurant_app/common/routes.dart';
import 'package:restaurant_app/common/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          Resources.svgImage.appLogo,
          width: 200,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/common/routes.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/injection.dart' as di;

void main() {
  di.init();
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Styles.colors.primaryColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Styles.colors.primaryColor,
          secondary: Styles.colors.secondaryColor,
        ),
      ),
      initialRoute: Routes.splash,
      getPages: Routes.getPages,
    );
  }
}

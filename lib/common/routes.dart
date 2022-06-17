import 'package:get/get.dart';
import 'package:restaurant_app/presentation/pages/home_page.dart';
import 'package:restaurant_app/presentation/pages/splash_page.dart';

abstract class Routes {
  static const splash = '/';
  static const home = '/home';

  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: home, page: () => const HomePage()),
  ];
}

abstract class Resources {
  static final svgImage = _SvgImage();
  static final json = _Json();
}

class _SvgImage {
  static const path = 'assets/images';
  final appLogo = '$path/app_logo.svg';
}

class _Json {
  static const path = 'assets/jsons';
  final localRestaurant = '$path/local_restaurant.json';
}
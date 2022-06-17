import 'package:restaurant_app/domain/entities/menu_item.dart';

class Menus {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });
}

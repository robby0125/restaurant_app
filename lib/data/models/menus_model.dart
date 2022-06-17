import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/data/models/menu_item_model.dart';
import 'package:restaurant_app/domain/entities/menus.dart';

part 'menus_model.g.dart';

@JsonSerializable()
class MenusModel {
  final List<MenuItemModel> foods;
  final List<MenuItemModel> drinks;

  MenusModel({
    required this.foods,
    required this.drinks,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) =>
      _$MenusModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenusModelToJson(this);

  Menus toEntity() => Menus(
        foods: foods.map((e) => e.toEntity()).toList(),
        drinks: drinks.map((e) => e.toEntity()).toList(),
      );
}

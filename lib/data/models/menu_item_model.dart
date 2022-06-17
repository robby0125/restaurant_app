import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/menu_item.dart';

part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItemModel {
  final String name;

  MenuItemModel({
    required this.name,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);

  MenuItem toEntity() => MenuItem(name: name);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse {
  final List<RestaurantModel> restaurants;

  RestaurantResponse(this.restaurants);

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}

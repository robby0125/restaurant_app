import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant_app/common/exception.dart';
import 'package:restaurant_app/common/resources.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/data/models/restaurant_response.dart';

abstract class RestaurantDataSource {
  Future<List<RestaurantModel>> getAllRestaurants();

  Future<List<RestaurantModel>> getTopRatedRestaurants();
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  @override
  Future<List<RestaurantModel>> getAllRestaurants() async {
    try {
      final result =
          await rootBundle.loadString(Resources.json.localRestaurant);
      return RestaurantResponse.fromJson(jsonDecode(result)).restaurants;
    } catch (e) {
      throw ResourceException('An error occurred while loading data');
    }
  }

  @override
  Future<List<RestaurantModel>> getTopRatedRestaurants() async {
    try {
      final result =
          await rootBundle.loadString(Resources.json.localRestaurant);
      final restaurants =
          RestaurantResponse.fromJson(jsonDecode(result)).restaurants;
      restaurants.sort((a, b) => b.rating.compareTo(a.rating));
      return restaurants.sublist(0, 5);
    } catch (e) {
      throw ResourceException('An error occurred while loading data');
    }
  }
}

import 'package:get/get.dart';
import 'package:restaurant_app/data/datasources/restaurant_data_source.dart';
import 'package:restaurant_app/data/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_app/domain/usecases/get_all_restaurants.dart';
import 'package:restaurant_app/domain/usecases/get_top_rated_restaurants.dart';
import 'package:restaurant_app/presentation/controllers/restaurants_controller.dart';

void init() {
  // datasource
  Get.lazyPut<RestaurantDataSource>(() => RestaurantDataSourceImpl());

  // repository
  Get.lazyPut<RestaurantRepository>(() => RestaurantRepositoryImpl(Get.find()));

  // use case
  Get.lazyPut(() => GetAllRestaurants(Get.find()));
  Get.lazyPut(() => GetTopRatedRestaurants(Get.find()));

  // controller
  Get.lazyPut(
    () => RestaurantsController(
      getAllRestaurants: Get.find(),
      getTopRatedRestaurants: Get.find(),
    ),
  );
}

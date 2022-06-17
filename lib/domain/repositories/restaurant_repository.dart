import 'package:dartz/dartz.dart';
import 'package:restaurant_app/common/failure.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getAllRestaurants();
}

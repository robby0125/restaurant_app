import 'package:dartz/dartz.dart';
import 'package:restaurant_app/common/failure.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';

class GetAllRestaurants {
  final RestaurantRepository repository;

  GetAllRestaurants(this.repository);

  Future<Either<Failure, List<Restaurant>>> execute() {
    return repository.getAllRestaurants();
  }
}

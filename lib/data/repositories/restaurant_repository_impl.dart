import 'package:dartz/dartz.dart';
import 'package:restaurant_app/common/exception.dart';
import 'package:restaurant_app/common/failure.dart';
import 'package:restaurant_app/data/datasources/restaurant_data_source.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource dataSource;

  RestaurantRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Restaurant>>> getAllRestaurants() async {
    try {
      final result = await dataSource.getAllRestaurants();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ResourceException catch (e) {
      return Left(ResourceFailure(e.message));
    }
  }
}

import 'package:get/get.dart';
import 'package:restaurant_app/common/request_state.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/usecases/get_all_restaurants.dart';
import 'package:restaurant_app/domain/usecases/get_top_rated_restaurants.dart';

class RestaurantsController extends GetxController {
  final GetAllRestaurants getAllRestaurants;
  final GetTopRatedRestaurants getTopRatedRestaurants;

  RestaurantsController({
    required this.getAllRestaurants,
    required this.getTopRatedRestaurants,
  });

  final _restaurants = <Restaurant>[].obs;

  List<Restaurant> get restaurants => _restaurants;

  final _topRatedRestaurants = <Restaurant>[].obs;

  List<Restaurant> get topRatedRestaurants => _topRatedRestaurants;

  final _message = ''.obs;

  String get message => _message.value;

  final _state = RequestState.empty.obs;

  RequestState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    _state.value = RequestState.loading;

    final restaurantsResult = await getAllRestaurants.execute();
    final topRatedResult = await getTopRatedRestaurants.execute();
    restaurantsResult.fold(
      (failure) {
        _message.value = failure.message;
        _state.value = RequestState.error;
      },
      (restaurantsData) {
        _restaurants.value = restaurantsData;

        topRatedResult.fold(
          (failure) {
            _message.value = failure.message;
            _state.value = RequestState.error;
          },
          (topRatedData) {
            _topRatedRestaurants.value = topRatedData;
            _state.value = RequestState.success;
          },
        );
      },
    );
  }
}

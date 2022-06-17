import 'package:get/get.dart';
import 'package:restaurant_app/common/request_state.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/domain/usecases/get_all_restaurants.dart';

class RestaurantsController extends GetxController {
  final GetAllRestaurants getAllRestaurants;

  RestaurantsController({
    required this.getAllRestaurants,
  });

  final _restaurants = <Restaurant>[].obs;

  List<Restaurant> get restaurants => _restaurants;

  final _message = ''.obs;

  String get message => _message.value;

  final _state = RequestState.empty.obs;

  RequestState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    fetchAllRestaurants();
  }

  Future<void> fetchAllRestaurants() async {
    _state.value = RequestState.loading;

    final result = await getAllRestaurants.execute();
    result.fold(
      (failure) {
        _message.value = failure.message;
        _state.value = RequestState.error;
      },
      (data) {
        _restaurants.value = data;
        _state.value = RequestState.success;
      },
    );
  }
}

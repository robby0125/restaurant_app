import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/request_state.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/presentation/controllers/restaurants_controller.dart';
import 'package:restaurant_app/presentation/widgets/restaurant_card.dart';
import 'package:restaurant_app/presentation/widgets/top_rated_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RestaurantsController restaurantsController = Get.find();
  int curTopRatedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Restaurant'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(Get.width, 200),
            painter: _HeaderPainter(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: List.generate(
                  5,
                  (_) => const TopRatedCard(
                    width: 300,
                    height: 225,
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, _) => setState(() {
                    curTopRatedIdx = index;
                  }),
                ),
              ),
              const SizedBox(height: 8),
              _buildCarouselIndicator(totalItem: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'All Restaurants',
                  style: Get.textTheme.headline6,
                ),
              ),
              Flexible(
                child: Obx(() {
                  final state = restaurantsController.state;

                  if (state == RequestState.success) {
                    final restaurants = restaurantsController.restaurants;

                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 16,
                      ),
                      itemBuilder: (_, __) => const RestaurantCard(),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemCount: restaurants.length,
                    );
                  } else if (state == RequestState.error) {
                    return Text(restaurantsController.message);
                  } else {
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }

  Row _buildCarouselIndicator({
    required int totalItem,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItem,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.only(left: index > 0 ? 4 : 0),
          width: index == curTopRatedIdx ? 20 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: index == curTopRatedIdx
                ? Styles.colors.red
                : Styles.colors.grey,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Styles.colors.primaryColor;
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      0,
      size.height * 0.5,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

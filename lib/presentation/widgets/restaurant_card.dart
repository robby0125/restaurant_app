import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/presentation/widgets/icon_text.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: Styles.colors.grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                restaurant.pictureId,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: Icon(
                        FontAwesomeIcons.image,
                        color: Colors.grey,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.city,
                    style: Get.textTheme.caption,
                  ),
                ],
              ),
            ),
            IconText(
              icon: FontAwesomeIcons.solidStar,
              text: restaurant.rating.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

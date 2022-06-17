import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/presentation/widgets/icon_text.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key}) : super(key: key);

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
              constraints: const BoxConstraints(
                minWidth: 120,
                minHeight: 80,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dummy\nRestaurant',
                    style: Get.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dummy\nAddress',
                    style: Get.textTheme.caption,
                  ),
                ],
              ),
            ),
            const IconText(
              icon: FontAwesomeIcons.solidStar,
              text: '4.1',
            ),
          ],
        ),
      ),
    );
  }
}

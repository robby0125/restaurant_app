import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/presentation/widgets/icon_text.dart';

class TopRatedCard extends StatelessWidget {
  final Restaurant restaurant;
  final double width;
  final double height;

  const TopRatedCard({
    Key? key,
    required this.restaurant,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            child: Image.network(
              restaurant.pictureId,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  restaurant.name,
                  style: Get.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  restaurant.city,
                  style: Get.textTheme.caption,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.solidStar,
                        text: restaurant.rating.toString(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.burger,
                        iconColor: Styles.colors.purple,
                        text: restaurant.menus.foods.length.toString(),
                        secondaryText: 'Foods',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.beerMugEmpty,
                        iconColor: Styles.colors.teal,
                        text: restaurant.menus.drinks.length.toString(),
                        secondaryText: 'Drinks',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

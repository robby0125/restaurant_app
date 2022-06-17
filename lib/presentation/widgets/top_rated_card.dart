import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/presentation/widgets/icon_text.dart';

class TopRatedCard extends StatelessWidget {
  final double width;
  final double height;

  const TopRatedCard({
    Key? key,
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
              'https://restaurant-api.dicoding.dev/images/medium/14',
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
                  'Dummy Restaurant',
                  style: Get.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Dummy Address',
                  style: Get.textTheme.caption,
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.solidStar,
                        text: '4.1',
                        secondaryText: '(200)',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.burger,
                        iconColor: Styles.colors.purple,
                        text: '10',
                        secondaryText: 'Foods',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: IconText(
                        icon: FontAwesomeIcons.beerMugEmpty,
                        iconColor: Styles.colors.teal,
                        text: '10',
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

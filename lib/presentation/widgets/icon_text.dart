import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:restaurant_app/common/styles.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final String secondaryText;
  final Color? iconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    this.secondaryText = '',
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 10,
          color: iconColor ?? Styles.colors.primaryColor,
        ),
        const SizedBox(width: 4),
        Text.rich(
          TextSpan(
            text: text,
            style: Get.textTheme.caption!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: secondaryText.isNotEmpty ? ' $secondaryText' : '',
                style: Get.textTheme.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

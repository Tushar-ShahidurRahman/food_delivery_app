import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class AppColumnWithStars extends StatelessWidget {
  final String text;
  const AppColumnWithStars({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(height: Dimensions.height4),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(Icons.star,
                      //Todo: Change the icon size here, make it dynamic
                      color: AppColors.mainColor,
                      size: 12)),
            ),
            SizedBox(width: Dimensions.width8),
            SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width8),
            SmallText(text: '1287'),
            SizedBox(width: Dimensions.width8),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle,
                iconColor: AppColors.iconColor1,
                text: 'Normal'),
            IconAndTextWidget(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: '1.7 km'),
            IconAndTextWidget(
                icon: Icons.access_time_sharp,
                iconColor: AppColors.iconColor2,
                text: '32 min'),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/widgets/icon_and_text_widget.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // stars
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(Icons.star,
                      color: AppColors.mainColor, size: Dimensions.iconSize24)),
            ),
            const SmallText(text: "4.5"),
            const SmallText(text: "1287"),
            const SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}

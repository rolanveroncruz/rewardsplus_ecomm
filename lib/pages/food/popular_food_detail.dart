// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/text_widgets.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/food0.png"))),
                )),
            // icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppIcon(icon: Icons.arrow_back_ios),
                    AppIcon(icon: Icons.shopping_cart_outlined)
                  ],
                )),
            // Introduction of food
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - 30,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: "Chinese Side"),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: "Introduce"),
                        SizedBox(height: Dimensions.height20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text:
                                    "Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice  Chicken marinated in a spiced yogurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice "),
                          ),
                        )
                      ],
                    )))
          ],
        ),
        bottomNavigationBar: Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        BigText(
                          text: "0",
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        Icon(Icons.add, color: AppColors.signColor)
                      ],
                    )),
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                    child: BigText(
                      text: "\$10 | Add to cart",
                      color: Colors.white,
                    ))
              ],
            )));
  }
}

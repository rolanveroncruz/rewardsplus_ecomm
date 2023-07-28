// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/expandable_text_widget.dart';

import '../../../utils/colors.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/text_widgets.dart';

class ItemDetail extends StatelessWidget {
  final ItemModel item;
  final oCcy = NumberFormat("#,##0.00", "en_US");
  ItemDetail({super.key, required this.item});

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
                          image: NetworkImage(item.media))),
                )),
            // icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    AppIcon(icon: Icons.arrow_back_ios,onClick: (){
                        Navigator.of(context).pop();

                    }),
                    AppIcon(icon: Icons.shopping_cart_outlined, onClick:(){} )

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
                        //AppColumn(item: item,),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: item.name),
                        SizedBox(height: Dimensions.height20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: item.longDescription ),
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
                      text: "\u20B1 ${oCcy.format(item.price)} | Add to cart",
                      color: Colors.white,
                    ))
              ],
            )));
  }
}

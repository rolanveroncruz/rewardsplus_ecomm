import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_body.dart';
import 'package:rewardsplus_ecomm/utils/colors.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';


class MainPageInitialized extends StatelessWidget {
  final List<ItemModel> items;
  const MainPageInitialized({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          // Page is a column of a header and body (carousel + items)
            child: Column(children: [
              // show header
              Container(
                  child: Container(
                    //margin: EdgeInsets.only(top: 45, bottom: 15),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      // Header is composed of a row of (column of text and a mag glass)
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Header
                            const Column(
                                children: [
                                  BigText( text: "Rewards Plus", color: AppColors.mainColor, size: 24,),
                                  Row(
                                    children: [
                                      SmallText(text: "Quezon City", color: Colors.black54),
                                      Icon(Icons.arrow_drop_down_rounded)
                                    ],
                                  )
                                ]
                            ),
                            // Magnifying glass
                            Center(
                              child: Container(
                                width: Dimensions.height45,
                                height: Dimensions.height45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                                    color: AppColors.mainColor),
                                child: Icon(Icons.search,
                                    color: Colors.white, size: Dimensions.iconSize24),
                              ),
                            )
                          ]
                      )
                  )
              ),
              // show body (carousel)
              Expanded(child: SingleChildScrollView(child: PageBody(items: items,)))
            ])));

  }
}

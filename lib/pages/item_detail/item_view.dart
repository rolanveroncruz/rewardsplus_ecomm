import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/app_icon.dart';
import 'package:rewardsplus_ecomm/widgets/expandable_text_widget.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';

import 'item_bloc.dart';
import 'item_event.dart';

class ItemDetailPage extends StatelessWidget {
  final ItemModel item;
  final MainBloc mainBloc;
  final oCcy = NumberFormat("#,##0.00", "en_US");

  ItemDetailPage({super.key, required this.item, required this.mainBloc, });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ItemBloc()..add(ItemInitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // final bloc = BlocProvider.of<ShopCartBloc>(context);
    return  Scaffold(
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
                  children: [
                    AppIcon(icon: Icons.arrow_back_ios, onClick: () {
                      mainBloc.add(MainNullEvent());
                      Navigator.of(context).pop();
                    }),
                    Badge.count(
                        count: 0,
                        child: AppIcon(icon: Icons.shopping_cart_outlined,
                            onClick: () {}))

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
                                text: item.longDescription),
                          ),
                        )
                      ],
                    )))
          ],
        ),
        /*
        This is the bottom part which has the quantity controller and the
        add to cart button.
         */
        bottomNavigationBar: Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                        left: Dimensions.width05,
                        right: Dimensions.width05),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          color: Colors.blueAccent,
                          onPressed: () {},
                        ),
                        BigText(
                          text: "0",
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.blueAccent,
                          onPressed: () {},)
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
                        color: Colors.blueAccent),
                    child: BigText(
                      text: "\u20B1 ${oCcy.format(item.price)} | Add to cart",
                      color: Colors.white,
                    ))
              ],
            )));
  }
}


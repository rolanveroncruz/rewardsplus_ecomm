import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rewardsplus_ecomm/pages/home/data/item_model.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';

import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final ItemModel item;
  final oCcy = NumberFormat("#,##0.00", "en_US");
  AppColumn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    //
    // This Column is the column of text and icons in the white box.
    // Its children are:
    // BigText for the name,
    // SizedBox for space
    // Row for stars and comments
    // SizedBox for space
    // Row for Icons
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: item.name, size: Dimensions.font26),
        //SizedBox(height: Dimensions.height10),
        SmallText(text: item.description),
        //SizedBox( height: Dimensions.height20, ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                BigText(text: "\u20B1 ${oCcy.format(item.price)}", size: Dimensions.font16, color: Colors.red ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle, color: Colors.blueAccent,size:40)),
            ]),
        ),
      ],
    );
  }
}

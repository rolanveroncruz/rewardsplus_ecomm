// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rewardsplus_ecomm/utils/colors.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(
                text: firstHalf,
                size: Dimensions.font16,
                color: AppColors.paraColor,
                height: 1.8,
              )
            : Column(
                children: [
                  SmallText(
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf),
                    size: Dimensions.font16,
                    color: AppColors.paraColor,
                    height: 1.8,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Row(
                        children: [
                          SmallText(
                              text: "Show more", color: AppColors.mainColor),
                          Icon(
                              hiddenText
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_up,
                              color: AppColors.mainColor)
                        ],
                      ))
                ],
              ));
  }
}

// ignore_for_file: avoid_unnecessary_containers

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/utils/dimensions.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';
import 'package:rewardsplus_ecomm/utils/colors.dart';

import '../../../widgets/app_column.dart';

class PageBody extends StatefulWidget {
  final List<ItemModel> items;
  const PageBody({super.key, required this.items});

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  final oCcy = NumberFormat("#,##0.00", "en_US");
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainerHeight;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /*
        carousel section.
       this has a height defined.
      */
      Container(
          height: Dimensions.pageViewHeight,
          child: PageView.builder(
              controller: pageController,
              itemCount: widget.items.length,
              itemBuilder: (context, position) {
                ItemModel item = widget.items[position];
                return _buildPageItem(position, item);
              })),
      //
      // dots indicator. This has its height defined.
      //
      DotsIndicator(
        dotsCount: widget.items.length,
        position: _currPageValue.toInt(),
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      //
      // Some vertical space. Height is defined.
      //
      SizedBox(
        height: Dimensions.height30,
      ),
      //
      // Some Text (i.e. Popular . Food pairing). Height should be definable.
      //
      Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const BigText(text: "Popular Grocery Items"),
            SizedBox(width: Dimensions.width10),
            Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: ".",
                  color: Colors.black26,
                )),
            SizedBox(width: Dimensions.width10),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: const SmallText(
                text: "Great deals!",
              ),
            )
          ])),
      SizedBox(height: Dimensions.height10,),
      //
      // List of images
      //
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          ItemModel item = widget.items[index];
          /*
          // Each item is Container with child: Row.
          */
          return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              // Each Row is a Container for an image, and an Expanded Container for text.
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item.media))),
                  ),
                  Expanded(
                    child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text: item.name),
                                //SizedBox(height: Dimensions.height10),
                                SmallText(
                                    text: item.description),
                                //SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(text: "\u20B1 ${oCcy.format(item.price)}", size: Dimensions.font16, color: Colors.red ),
                                    IconButton(onPressed: (){
                                      BlocProvider.of<MainBloc>(context).add(MainItemDetailEvent(item));
                                    }, icon: const Icon(Icons.add_circle, color: Colors.blueAccent,size:40)),
                                ],)
                              ],
                            ))),
                  )
                ],
              ));
        },
      )
    ]);
  }

  Widget _buildPageItem(int index, ItemModel item) {
    // Build the items for the carousel.
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      // currPagelue - index goes from 0..1
      // 1-_scalFactor is constant at 0.2
      // currScale goes from 1 to 0.8
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      // _currPageValue - index goes from -1..0
      // _currPageValue - index + 1 goes from 0..1
      // (currPageValue-index+1)*(1-_scaleFactor)goes from 0..0.2
      // scaleFactor goes from 0.8 to 1.0
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    // This is the main widget to return. All the code above is just to build
    // the matrix variable used below.
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
            height: Dimensions.pageViewContainerHeight,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(item.media)),
            )),
        /// This is for the small box below the image.
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 120,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                // AppColumn is the white box under the picture
                child: AppColumn(item: item),
              )),
        ),
      ]),
    );
  }
}

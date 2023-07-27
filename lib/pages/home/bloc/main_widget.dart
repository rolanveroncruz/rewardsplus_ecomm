import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_body.dart';
import 'package:rewardsplus_ecomm/widgets/text_widgets.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';


class MainPageWidget extends StatelessWidget {

  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen:(previous, current){
          return true;
        },
        builder:(context, state) {
          switch(state.runtimeType){
            case MainInitializingState:
              return const Center(child: CircularProgressIndicator());

            case MainInitializedState:
              return Scaffold(
                body: SafeArea(
                child: Column(children: [
                // show header
                    Container(
                      child: Container(
                      //margin: EdgeInsets.only(top: 45, bottom: 15),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                const Column(
                                  children: [
                                    BigText( text: "Manila", color: AppColors.mainColor, size: 30,),
                                    Row(
                                      children: [
                                        SmallText(text: "Quezon City", color: Colors.black54),
                                        Icon(Icons.arrow_drop_down_rounded)
                                      ],
                                   )
                                  ]
                                ),
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
                    const Expanded(child: SingleChildScrollView(child: PageBody()))
    ])));


          };
          

      
  


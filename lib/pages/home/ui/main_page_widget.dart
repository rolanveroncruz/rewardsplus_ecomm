import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/main_data.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/item_detail.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_initialized.dart';


class MainPageWidget extends StatelessWidget {

  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ItemRepository> (
      create: (context) => ItemRepository(),
      child: BlocProvider<MainBloc>(
        create: (BuildContext context) {
          ItemRepository itemRepository = RepositoryProvider.of<ItemRepository>(context);
            return MainBloc(itemRepository: itemRepository)..add(MainInitialEvent());
          },
        child: BlocConsumer<MainBloc, MainState>(
            listenWhen: (previousState, currentState){
              return currentState.runtimeType == MainAddedToCartState;
            },
            listener: (BuildContext context, Object? state) {
              if (state.runtimeType == MainAddedToCartState){
                var theState = state as MainAddedToCartState;
                var item = theState.item;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetail(item: item)));
              }
            },
            buildWhen: (MainState previousState, MainState currentState){
              return (previousState != currentState && currentState.runtimeType != MainAddedToCartState);
            },
            builder: (BuildContext context, state) {
              switch (state.runtimeType) {
                case MainInitializingState:
                  return const Center(child: CircularProgressIndicator());

                case MainInitializedState:
                  MainInitializedState theState = state as MainInitializedState;
                  return MainPageInitialized(items: theState.items,);


                default:
                  return const Center(child: Text("Error"));
              }
            }
                )));
  }
}

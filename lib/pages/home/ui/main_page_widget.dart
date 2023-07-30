import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/item_detail.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_initialized.dart';
import 'package:rewardsplus_ecomm/pages/loading_screen.dart';


class MainPageWidget extends StatelessWidget {

  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DataRepository> (
      create: (context) => DataRepository(),
      child: BlocProvider<MainBloc>(
        create: (BuildContext context) {
          DataRepository dataRepository = RepositoryProvider.of<DataRepository>(context);
            return MainBloc(dataRepository: dataRepository)..add(MainInitialEvent());
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
                  return const LoadingScreen();

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

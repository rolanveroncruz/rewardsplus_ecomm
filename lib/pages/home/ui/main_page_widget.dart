import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/bloc/main_bloc.dart';
import 'package:rewardsplus_ecomm/pages/home/data/main_data.dart';
import 'package:rewardsplus_ecomm/pages/home/ui/main_page_initialized.dart';


class MainPageWidget extends StatelessWidget {

  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ItemRepository(),
      child: BlocProvider(
          create: (context) => MainBloc(itemRepository: RepositoryProvider.of<ItemRepository>(context))..add(MainInitialEvent()),
          child: BlocBuilder<MainBloc, MainState>(
              buildWhen: (previous, current) {
                return true;
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case MainInitializingState:
                    return const Center(child: CircularProgressIndicator());

                  case MainInitializedState:
                    return const MainPageInitialized();

                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rewardsplus_ecomm/pages/home/data/item_model.dart';
import 'package:rewardsplus_ecomm/pages/home/data/main_data.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitializingState()) {
    on<MainInitialEvent>(mainInitialEvent);
  }

  FutureOr<void> mainInitialEvent(MainInitialEvent event, Emitter<MainState> emit) async {
    emit(MainInitializingState());
    ItemRepository itemRepo = ItemRepository();
    List<ItemModel> items = await itemRepo.getItems();
    emit(MainInitializedState(items: items));
  }
}

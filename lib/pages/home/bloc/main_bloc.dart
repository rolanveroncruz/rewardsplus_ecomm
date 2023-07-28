import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/data/main_data.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ItemRepository itemRepository;
  MainBloc({required this.itemRepository}) : super(MainInitializingState()) {
    on<MainInitialEvent>(mainInitialEvent);
    on<MainAddToCartEvent>(mainAddToCartEvent);
  }

  FutureOr<void> mainInitialEvent(MainInitialEvent event, Emitter<MainState> emit) async {
    emit(MainInitializingState());
    List<ItemModel> items = await itemRepository.getItems();
    emit(MainInitializedState(items: items));
  }

  FutureOr<void> mainAddToCartEvent(MainAddToCartEvent event, Emitter<MainState> emit) async{
    final item = event.item;
    emit(MainAddedToCartState(item:item));
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/item_model.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final DataRepository dataRepository;
  MainBloc({required this.dataRepository}) : super(MainInitializingState()) {
    on<MainInitialEvent>(mainInitialEvent);
    on<MainItemDetailEvent>(mainItemDetailEvent);
    on<MainNullEvent>(mainNullEvent);
  }

  FutureOr<void> mainInitialEvent(MainInitialEvent event, Emitter<MainState> emit) async {
    emit(MainInitializingState());
    List<ItemModel> items = await dataRepository.itemDataRepository.getItems();
    emit(MainInitializedState(items: items));
  }

  FutureOr<void> mainItemDetailEvent(MainItemDetailEvent event, Emitter<MainState> emit) async{
    final item = event.item;
    emit(MainItemDetailState(item:item));
  }

  FutureOr<void> mainNullEvent(MainNullEvent event, Emitter<MainState> emit) {
    emit(MainNullState());
  }
}

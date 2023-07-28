part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable{}

class MainInitializingState extends MainState {
  @override
  List<Object?> get props => [];
}


class MainInitializedState extends MainState {
  final List<ItemModel> items;

  MainInitializedState({required this.items});
  @override
  List<Object?> get props => [items];
}

class MainAddedToCartState extends MainState{
  final ItemModel item;

  MainAddedToCartState({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];

}
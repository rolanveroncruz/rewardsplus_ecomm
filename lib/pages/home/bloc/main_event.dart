part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class MainInitialEvent extends MainEvent{
  @override
  List<Object?> get props => [];

}

class MainAddToCartEvent extends MainEvent{
  final ItemModel item;

  MainAddToCartEvent(this.item);

  @override
  List<Object?> get props => [];

}


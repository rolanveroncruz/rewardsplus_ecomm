part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class MainInitialEvent extends MainEvent{
  @override
  List<Object?> get props => [];

}

class MainItemDetailEvent extends MainEvent{
  final ItemModel item;

  MainItemDetailEvent(this.item);

  @override
  List<Object?> get props => [];

}

class MainNullEvent extends MainEvent{
  @override
  List<Object?> get props => [];
}



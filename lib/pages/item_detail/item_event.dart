import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable{}

class ItemInitEvent extends ItemEvent {
  @override
  List<Object?> get props => [];
}
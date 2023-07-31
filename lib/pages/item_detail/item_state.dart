import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ItemState extends Equatable {
}

class ItemInitState extends ItemState {
  @override
  List<Object?> get props => [];
}
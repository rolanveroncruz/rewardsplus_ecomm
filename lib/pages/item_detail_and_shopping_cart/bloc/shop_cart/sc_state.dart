import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ShopCartState extends Equatable {
}

class SCInitState extends ShopCartState {
  @override
  List<Object?> get props => [];
}
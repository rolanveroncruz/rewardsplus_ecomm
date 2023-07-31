
import 'package:equatable/equatable.dart';
import 'package:rewardsplus_ecomm/data/models/user_model.dart';

abstract class IdentityState extends Equatable {
}


class IdentityInitState extends IdentityState {
  final User? user;

  IdentityInitState({this.user});

  @override
  List<Object?> get props => [];

}

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

class IdentitySigningInState extends IdentityState{
  @override
  List<Object?> get props => [];

}
class IdentitySignedInState extends IdentityState{
  final User user;

  IdentitySignedInState({required this.user});
  @override
  List<Object?> get props => throw [user];
}

class IdentitySigningInErrorState extends IdentityState{
  final String errorString;

  IdentitySigningInErrorState({required this.errorString});
  @override
  List<Object?> get props => [errorString];

}
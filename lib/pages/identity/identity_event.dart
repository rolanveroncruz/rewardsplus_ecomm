
import 'package:equatable/equatable.dart';

abstract class IdentityEvent extends Equatable{}


class IdentityInitEvent extends IdentityEvent {

  @override
  List<Object?> get props => [];
}

class IdentitySigningInEvent extends IdentityEvent{
  final String email;
  final String password;

  IdentitySigningInEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];


}
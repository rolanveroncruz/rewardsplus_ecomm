
import 'package:equatable/equatable.dart';

abstract class IdentityEvent extends Equatable{}


class IdentityInitEvent extends IdentityEvent {

  @override
  List<Object?> get props => [];
}
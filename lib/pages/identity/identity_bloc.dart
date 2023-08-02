import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';
import 'package:rewardsplus_ecomm/data/user_data_repository.dart';

import 'identity_event.dart';
import 'identity_state.dart';

class IdentityBloc extends Bloc<IdentityEvent, IdentityState> {
  final DataRepository dataRepository;
  IdentityBloc({required this.dataRepository}) : super(IdentityInitState()){
    on<IdentityInitEvent>(identityInitEvent);
    on<IdentitySigningInEvent>(identitySigningInEvent);
    
  }

  
  FutureOr<void> identityInitEvent(IdentityInitEvent event, Emitter<IdentityState> emit)  {
    emit(IdentityInitState());
  }

  FutureOr<void> identitySigningInEvent(IdentitySigningInEvent event, Emitter<IdentityState> emit) async {
    // emit(IdentitySigningInState());

    final UserDataRepository userDataRepository = dataRepository.userDataRepository;
    var (status, user, reason) = await  userDataRepository.signIn(event.email, event.password);
    if (status==0) {
      emit(IdentitySignedInState(user:user!));
    } else {
      emit(IdentitySigningInErrorState(errorString: reason!));
    }
  }
}


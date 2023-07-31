import 'dart:async';

import 'package:bloc/bloc.dart';

import 'identity_event.dart';
import 'identity_state.dart';

class IdentityBloc extends Bloc<IdentityEvent, IdentityState> {
  IdentityBloc() : super(IdentityInitState()){
    on<IdentityInitEvent>(identityInitEvent);
    
  }

  
  FutureOr<void> identityInitEvent(IdentityInitEvent event, Emitter<IdentityState> emit)  {
    emit(IdentityInitState());
  }
}


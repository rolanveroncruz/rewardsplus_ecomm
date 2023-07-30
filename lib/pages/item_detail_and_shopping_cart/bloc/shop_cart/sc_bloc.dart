import 'package:bloc/bloc.dart';

import 'sc_event.dart';
import 'sc_state.dart';

class ShopCartBloc extends Bloc<ShopCartEvent, ShopCartState> {
  ShopCartBloc() : super(SCInitState());



}

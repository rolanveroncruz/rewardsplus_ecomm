import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sc_bloc.dart';
import 'sc_event.dart';

class ShopCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCartBloc()..add(SCInitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // final bloc = BlocProvider.of<ShopCartBloc>(context);
    return Container();
  }
}


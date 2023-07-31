import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';
import 'package:rewardsplus_ecomm/data/models/user_model.dart';
import 'package:rewardsplus_ecomm/pages/identity/ui/LoginSignup.dart';
import 'package:rewardsplus_ecomm/pages/identity/ui/profile_page.dart';

import 'identity_bloc.dart';
import 'identity_event.dart';
import 'identity_state.dart';

class IdentityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
        IdentityBloc()
          ..add(IdentityInitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    // final bloc = BlocProvider.of<IdentityBloc>(context);
    return BlocConsumer<IdentityBloc, IdentityState>(
        builder: (BuildContext context, state) {
      switch (state.runtimeType) {
        case IdentityInitState:
          final User? user = RepositoryProvider.of<DataRepository>(context).userDataRepository.getUser();
          if (user==null) {
            return const LoginSignUp();
          } else {
            return const ProfilePage();
          }
        default:
          return const ProfilePage();
      }
    },
    listener: (BuildContext context, state){

    });
  }
}


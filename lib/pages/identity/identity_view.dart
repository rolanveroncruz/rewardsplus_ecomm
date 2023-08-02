import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewardsplus_ecomm/data/data_repository.dart';
import 'package:rewardsplus_ecomm/data/models/user_model.dart';
import 'package:rewardsplus_ecomm/pages/identity/ui/LoginSignup.dart';
import 'package:rewardsplus_ecomm/pages/identity/ui/profile_page.dart';
import 'package:rewardsplus_ecomm/pages/loading_screen.dart';

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
        IdentityBloc( dataRepository: RepositoryProvider.of<DataRepository>(context))
          ..add(IdentityInitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final identityBloc = BlocProvider.of<IdentityBloc>(context);
    return BlocConsumer<IdentityBloc, IdentityState  >(
      buildWhen:(IdentityState previous, IdentityState current){
        if (current.runtimeType == IdentitySigningInErrorState){
          return false;
    }else {
          return true;
    }
    },
        builder: (BuildContext context, state) {
          DataRepository dataRepository = RepositoryProvider.of<DataRepository>(context);
      switch (state.runtimeType) {
        case IdentityInitState:
          final User? user = dataRepository.userDataRepository.getUser();
          if (user==null) {
            return LoginSignUp(userDataRepository: dataRepository.userDataRepository, identityBloc: identityBloc, );
          } else {
            return const ProfilePage(user: null,);
          }
        case IdentitySigningInState:
          return const LoadingScreen();
        case IdentitySignedInState:
          var theState = state as IdentitySignedInState;
          return ProfilePage(user: theState.user,);
        default:
          return const Center(child: Text("Error"));
      }
    },
        listenWhen: (IdentityState previous, IdentityState current){
          if (current.runtimeType == IdentitySigningInErrorState ){
            return true;
          }
          else {
            return false;
          }
        },
          listener: (BuildContext context, state) async{
          if (state.runtimeType == IdentitySigningInErrorState){
            var theState = state as IdentitySigningInErrorState;
            var message = theState.errorString;
            await showFlushBar(
                context:context, title:"Login Error", message: message);
          }

    });
  }
  Future<void> showFlushBar({required BuildContext context, required String title, required String message}) async{
    Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 5),
    ).show(context);

  }
}


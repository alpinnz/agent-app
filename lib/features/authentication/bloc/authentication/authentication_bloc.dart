import 'dart:async';
import 'dart:io';

import 'package:agent/features/authentication/model/user.model.dart';
import 'package:agent/features/authentication/repository/authentication.repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({this.authenticationRepository})
      : assert(authenticationRepository != null),
        super(AuthenticationUninitialized());

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      await Future.delayed(Duration(seconds: 1));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> checkLoad() async {
    List<bool> listLogic = [];
    bool connection = await checkConnection();
    listLogic.add(connection);

    bool status = listLogic.contains(false);
    await Future.delayed(Duration(seconds: 1));
    return !status;
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield AuthenticationLoading();
    // app started event
    if (event is AppStarted) {
      final bool load = await checkLoad();

      if (!load) {
        await Future.delayed(Duration(seconds: 1));
        yield AuthenticationFailure(
          error: 'check your connection or the server is down.',
        );
        return;
      }

      final bool token = await authenticationRepository.hasToken();
      await Future.delayed(Duration(seconds: 1));
      if (token) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authenticationRepository.persistToken(event.token);
      await Future.delayed(Duration(seconds: 1));
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authenticationRepository.deleteToken();
      await Future.delayed(Duration(seconds: 1));
      yield AuthenticationUnauthenticated();
    }
  }
}

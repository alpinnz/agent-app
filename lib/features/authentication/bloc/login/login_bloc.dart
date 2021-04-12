import 'dart:async';

import 'package:agent/features/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:agent/features/authentication/model/login.model.dart';
import 'package:agent/features/authentication/repository/authentication.repository.dart';
import 'package:agent/features/authentication/repository/user.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authenticationRepository,
    @required this.authenticationBloc,
    @required this.userRepository,
  })  : assert(authenticationRepository != null),
        assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final data = await authenticationRepository.login(
          username: event.username,
          password: event.password,
        );
        if (data is LoginModel) {
          if (data.succes == true) {
            authenticationBloc.add(LoggedIn(token: data.token));
            userRepository.saveUser(data.user);
          } else {
            yield LoginFailure(error: data.message.toString());
          }
        } else {
          yield LoginFailure(error: "failed");
        }
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}

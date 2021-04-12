import 'dart:async';

import 'package:agent/features/authentication/model/user.model.dart';
import 'package:agent/features/authentication/repository/user.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'main.event.dart';
part 'main.state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final UserRepository userRepository;

  MainBloc({
    @required this.userRepository,
  })  : assert(userRepository != null),
        super(MainInitial());

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is MainLoadEvent) {
      yield MainLoading();
      try {
        UserModel userModel = await userRepository.getUser();
        if (userModel == null) {
          yield MainFailure(error: 'error');
          return;
        }

        yield MainLoaded(userModel: userModel);
      } catch (error) {
        yield MainFailure(error: error.toString());
      }
    }
  }
}

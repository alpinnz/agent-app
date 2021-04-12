part of 'main.bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final UserModel userModel;
  const MainLoaded({@required this.userModel});
  @override
  List<Object> get props => [userModel];
  @override
  String toString() => 'MainLoaded { userModel: $userModel }';
}

class MainFailure extends MainState {
  final String error;
  const MainFailure({@required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'MainFailure { error: $error }';
}

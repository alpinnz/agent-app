part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String error;
  const AuthenticationFailure({@required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'AuthenticationFailure { error: $error }';
}

class AuthenticationLoading extends AuthenticationState {}

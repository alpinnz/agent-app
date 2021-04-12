part of 'main.bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

/// App started event
class MainLoadEvent extends MainEvent {}

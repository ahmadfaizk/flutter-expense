import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class EmptyState extends BaseState {}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  final String message;
  const ErrorState({this.message});

  @override
  List<Object> get props => [message];
}

class SuccessState<T> extends BaseState {
  final T data;
  const SuccessState({this.data});

  @override
  List<Object> get props => [data];
}

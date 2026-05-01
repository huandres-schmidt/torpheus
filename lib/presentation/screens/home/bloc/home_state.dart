part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

final class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}

final class HomeLoaded extends HomeState {
  const HomeLoaded();

  @override
  List<Object?> get props => [];
}

final class HomeFail extends HomeState {
  const HomeFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
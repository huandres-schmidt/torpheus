part of 'menu_bloc.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

final class MenuCarregar extends MenuEvent {
  const MenuCarregar();

  @override
  List<Object?> get props => [];
}

final class MenuTrocarTela extends MenuEvent {
  const MenuTrocarTela(this.indexScreen);

  final int indexScreen;

  @override
  List<Object?> get props => [indexScreen];
}
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuInitial()) {
    on<MenuCarregar>(_onMenuLoad);
    on<MenuTrocarTela>(_onMenuTrocarTela);
  }

  Future<void> _onMenuLoad(
    MenuCarregar event,
    Emitter<MenuState> emit,
  ) async {
    try {
      emit(const MenuLoading());

      emit(MenuLoaded(indexScreen: state.indexScreen));
    } catch (e) {
      emit(const MenuFail('Deu rim'));
    }
  }

  void _onMenuTrocarTela(
    MenuTrocarTela event,
    Emitter<MenuState> emit,
  ) {
    emit(MenuLoaded(indexScreen: event.indexScreen));
  }
}

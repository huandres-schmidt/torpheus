import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'painel_event.dart';

part 'painel_state.dart';

class PainelBloc extends Bloc<PainelEvent, PainelState> {
  PainelBloc() : super(const PainelInitial()) {
    on<PainelCarregar>(_onPainelLoad);
  }

  Future<void> _onPainelLoad(
    PainelEvent event,
    Emitter<PainelState> emit,
  ) async {
    try {
      emit(const PainelLoading());

      emit(const PainelLoaded());
    } catch (e) {
      emit(const PainelFail('Deu rim'));
    }
  }
}

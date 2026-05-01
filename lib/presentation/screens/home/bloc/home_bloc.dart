import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeCarregar>(_onHomeLoad);
  }

  Future<void> _onHomeLoad(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(const HomeLoading());

      emit(const HomeLoaded());
    } catch (e) {
      emit(const HomeFail('Deu rim'));
    }
  }
}

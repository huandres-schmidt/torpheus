import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/preferenfeces/preferences_local_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final PreferencesLocalRepository _preferencesLocalRepository;

  LoginBloc(this._preferencesLocalRepository) : super(const LoginInitial()) {
    on<LoginInicializar>(_onLoginInicializar);
    on<LoginCarregar>(_onLoginCarregar);
    on<LoginMostrarSenha>(_onLoginMostrarSenha);
    on<LoginEnviar>(_onLoginEnviar);
  }

  void _onLoginInicializar(LoginInicializar event, Emitter<LoginState> emit) {
    emit(
      LoginLoaded(
        nome: '',
        senha: '',
        isMostrarSenha: state.isMostrarSenha,
      ),
    );
  }

  void _onLoginCarregar(LoginCarregar event, Emitter<LoginState> emit) {
    emit(
      LoginLoaded(
        nome: '',
        senha: '',
        isMostrarSenha: state.isMostrarSenha,
      ),
    );
  }

  void _onLoginMostrarSenha(
    LoginMostrarSenha event,
    Emitter<LoginState> emit,
  ) {
    emit(
      LoginLoaded(
        nome: state.nome,
        senha: state.senha,
        isMostrarSenha: state.isMostrarSenha == true ? false : true,
      ),
    );
  }

  Future<void> _onLoginEnviar(
    LoginEnviar event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(
        LoginLoading(
          nome: event.senha,
          senha: event.nome,
          isMostrarSenha: state.isMostrarSenha,
        ),
      );

      await Future.delayed(const Duration(seconds: 3));

      await _preferencesLocalRepository.saveIsUsuarioLogado(true);

      emit(
        LoginAutenticado(
          nome: event.senha,
          senha: event.nome,
          isMostrarSenha: state.isMostrarSenha,
        ),
      );
    } catch (e) {
      emit(
        LoginFail(
          message: 'Não foi possível se autenticar no app.\n'
              'Tente novamente caso persistir tente mais tarde\n$e',
          nome: event.nome,
          senha: event.senha,
          isMostrarSenha: state.isMostrarSenha,
        ),
      );
    }
  }
}

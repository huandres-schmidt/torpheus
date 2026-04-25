part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginInicializar extends LoginEvent {
  const LoginInicializar();

  @override
  List<Object?> get props => [];
}

final class LoginCarregar extends LoginEvent {
  const LoginCarregar();

  @override
  List<Object?> get props => [];
}

final class LoginEnviar extends LoginEvent {
  const LoginEnviar({required this.nome, required this.senha});

  final String nome;
  final String senha;

  @override
  List<Object?> get props => [nome, senha];
}

final class LoginMostrarSenha extends LoginEvent {
  const LoginMostrarSenha();

  @override
  List<Object?> get props => [];
}
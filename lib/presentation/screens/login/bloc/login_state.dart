part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState({
    this.nome = '',
    this.senha = '',
    this.isMostrarSenha = false,
  });

  final String nome;
  final String senha;
  final bool isMostrarSenha;

  @override
  List<Object?> get props => [nome, senha, isMostrarSenha];
}

final class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  const LoginLoading({
    required super.nome,
    required super.senha,
    required super.isMostrarSenha,
  });

  @override
  List<Object?> get props => [nome, senha, isMostrarSenha];
}

final class LoginLoaded extends LoginState {
  const LoginLoaded({
    required super.nome,
    required super.senha,
    required super.isMostrarSenha,
  });

  @override
  List<Object?> get props => [nome, senha, isMostrarSenha];
}

final class LoginFail extends LoginState {
  const LoginFail({
    required this.message,
    required super.nome,
    required super.senha,
    required super.isMostrarSenha,
  });

  final String message;

  @override
  List<Object?> get props => [message, nome, senha, isMostrarSenha];
}

final class LoginAutenticado extends LoginState {
  const LoginAutenticado({
    required super.nome,
    required super.senha,
    required super.isMostrarSenha,
  });

  @override
  List<Object?> get props => [nome, senha, isMostrarSenha];
}

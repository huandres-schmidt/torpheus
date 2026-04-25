enum Preferences {
  accessToken('acess_token'),
  refreshToken('refresh_token'),
  isUsuarioLogado('is_usuario_logado');

  final String key;

  const Preferences(this.key);
}

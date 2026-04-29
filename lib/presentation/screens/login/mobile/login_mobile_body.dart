import 'package:flutter/material.dart';
import 'package:torpheus/presentation/screens/login/bloc/login_bloc.dart';

import '../widgets/login_form.dart';

class LoginMobileBody extends StatelessWidget {
  const LoginMobileBody({
    super.key,
    required this.state,
    required this.controllerNome,
    required this.controllerSenha,
    required this.formKey,
  });

  final LoginState state;
  final TextEditingController controllerNome;
  final TextEditingController controllerSenha;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return LoginForm(
      state: state,
      formKey: formKey,
      controllerSenha: controllerSenha,
      controllerNome: controllerNome,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torpheus/config/routes.dart';
import 'package:torpheus/core/shared/app_system_info.dart';
import 'package:torpheus/presentation/screens/login/bloc/login_bloc.dart';

import '../../../components/versao_app.dart';
import 'login_body.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: _listener,
        buildWhen: _buildWhen,
        builder: (context, state) {
          if (state is LoginInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LoginLoaded) {
            return LoginBody(
              controllerNome: controllerNome,
              controllerSenha: controllerSenha,
              formKey: formKey,
              state: state,
            );
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: const VersaoApp(),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginAutenticado) {
      Navigator.of(context).pushNamed(AppRoutes.home.route);
    }
  }

  bool _buildWhen(LoginState previous, LoginState current) {
    return current is! LoginFail &&
        current is! LoginLoading &&
        current is! LoginAutenticado;
  }
}

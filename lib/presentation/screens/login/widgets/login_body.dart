import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torpheus/presentation/screens/login/bloc/login_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
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
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextFormField(),
          TextFormField(
            obscureText: !state.isMostrarSenha,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<LoginBloc>().add(const LoginMostrarSenha());
                },
                icon: state.isMostrarSenha
                    ? const Icon(Icons.visibility_sharp)
                    : const Icon(Icons.visibility_off),
              ),
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginEnviar(
                          nome: controllerNome.text,
                          senha: controllerSenha.text,
                        ),
                      );
                },
                child: state is LoginLoading
                    ? const CircularProgressIndicator()
                    : const Text('ENTRAR'),
              );
            },
          ),
        ],
      ),
    );
  }
}

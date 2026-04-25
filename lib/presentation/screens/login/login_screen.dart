import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torpheus/presentation/screens/login/bloc/login_bloc.dart';
import 'package:torpheus/presentation/screens/login/widgets/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginBloc..add(const LoginCarregar()),
      child: const LoginContent(),
    );
  }
}

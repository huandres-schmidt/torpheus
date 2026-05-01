import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torpheus/presentation/screens/home/bloc/home_bloc.dart';
import 'package:torpheus/presentation/screens/home/web/home_web_content.dart';

import 'mobile/home_mobile_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc..add(const HomeCarregar()),
      child: kIsWeb ? const HomeWebContent() : const HomeMobileContent(),
    );
  }
}

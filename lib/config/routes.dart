import 'package:flutter/material.dart';
import 'package:torpheus/presentation/screens/home/bloc/home_bloc.dart';
import 'package:torpheus/presentation/screens/home/home_screen.dart';
import 'package:torpheus/presentation/screens/login/bloc/login_bloc.dart';
import 'package:torpheus/presentation/screens/menu/bloc/menu_bloc.dart';
import '../presentation/screens/authentication/authentication_bloc/authentication_bloc.dart';

import '../injector.dart';
import '../presentation/components/animation/modal_page_route.dart';
import '../presentation/screens/authentication/authentication_screen.dart';
import '../presentation/screens/login/login_screen.dart';

enum NavigationFlow { simple, modalBottomUp }

enum AppRoutes {
  root('/', NavigationFlow.simple),
  login('/login', NavigationFlow.simple),
  home('/home', NavigationFlow.simple);

  final String route;
  final NavigationFlow flow;

  const AppRoutes(this.route, this.flow);

  static AppRoutes fromName(String? screenName) {
    return AppRoutes.values.firstWhere(
      (e) => e.route == screenName,
      orElse: () => root,
    );
  }
}

class Routes {
  static PageRoute router(RouteSettings settings, Injector injector) {
    final appRoute = AppRoutes.fromName(settings.name);

    final Widget screen = switch (appRoute) {
      AppRoutes.login => LoginScreen(
          loginBloc: injector.getIt.get<LoginBloc>(),
        ),
      AppRoutes.root => AuthenticationScreen(
          authenticationBloc: injector.getIt.get<AuthenticationBloc>(),
          loginBloc: injector.getIt.get<LoginBloc>(),
          menuBloc: injector.getIt.get<MenuBloc>(),
          homeBloc: injector.getIt.get<HomeBloc>(),
        ),
      AppRoutes.home => HomeScreen(
          homeBloc: injector.getIt.get<HomeBloc>(),
        ),
    };

    return switch (appRoute.flow) {
      NavigationFlow.modalBottomUp => ModalPageRoute(
          builder: (context) => screen,
          modalSettings: settings,
        ),
      NavigationFlow.simple => MaterialPageRoute(
          builder: (context) => screen,
          settings: settings,
        )
    };
  }
}

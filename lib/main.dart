import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'config/flavor.dart';
import 'injector.dart';

void main() async {
  FlavorConfig(const bool.fromEnvironment('bool.env', defaultValue: true));

  final Injector injector = await _initializeApp();

  runApp(TorpheusApp(injector: injector));
}

Future<Injector> _initializeApp() async {

  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final Injector injector = await InjectorImpl.initializeDependencies();
  await _loadEssentialData(injector);
  return injector;
}

Future<void> _loadEssentialData(Injector injector) async {}

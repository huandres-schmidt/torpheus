import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../config/flavor.dart';

class TargetApp extends StatelessWidget {
  final Widget child;

  const TargetApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode || FlavorConfig.isHomolog()) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Banner(
          message: FlavorConfig.envString(),
          location: BannerLocation.topEnd,
          child: child,
        ),
      );
    }
    return child;
  }
}

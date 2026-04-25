import 'package:flutter/material.dart';

import '../../core/shared/app_system_info.dart';

class VersaoApp extends StatelessWidget {
  const VersaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        '${AppSystemInfo.appInfo?.appVersionInfo.appVersionName} - '
        '${AppSystemInfo.appInfo?.appVersionInfo.appVersionCode}',
        textAlign: TextAlign.center,
      ),
    );
  }
}

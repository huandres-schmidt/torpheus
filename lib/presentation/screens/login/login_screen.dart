import 'package:flutter/material.dart';

import '../../../core/shared/app_system_info.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          Text(
            "${AppSystemInfo.appInfo?.appVersionInfo.appVersionName} - "
            "${AppSystemInfo.appInfo?.appVersionInfo.appVersionCode}",
          ),
        ],
      ),
    );
  }
}

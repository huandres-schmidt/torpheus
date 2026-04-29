import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../../../data/plugins/device_hardware_info.dart';

class DeviceHardwareInfoImpl implements DeviceHardwareInfo {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  @override
  Future<String> getBrand() async {
    if (kIsWeb) return 'BROWSER';

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.brand;
    } else if (Platform.isIOS) {
      return 'APPLE';
    }
    return '0';
  }

  @override
  Future<String> getHardware() async {
    if (kIsWeb) return 'WEB_EXT';

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.hardware;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
    return '0';
  }

  @override
  Future<String> getManufacturer() async {
    if (kIsWeb) return 'WEB';

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.manufacturer;
    } else if (Platform.isIOS) {
      return 'Apple';
    }
    return '0';
  }

  @override
  Future<String> getModel() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfo.webBrowserInfo;
      return webInfo.browserName.name;
    }

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.model;
    }
    return '0';
  }

  @override
  Future<String> getOperationalSystem() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfo.webBrowserInfo;
      return 'WEB_${webInfo.platform}';
    }

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return 'ANDROID_${androidInfo.version.release}';
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      return 'IOS_${iosInfo.systemVersion}';
    }
    return '0';
  }

  @override
  Future<int> getApiLevel() async {
    if (kIsWeb) return 0;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.version.sdkInt;
    }

    return 0;
  }
}

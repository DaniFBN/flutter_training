import 'package:flutter/cupertino.dart';

abstract class IAppVersionService {
  ValueNotifier<AppVersion> get version;
}

class AppVersion {
  final String packageName;
  final String appName;
  final String version;
  final String buildNumber;

  bool get _isDev => packageName.endsWith('.debug');
  bool get _isStage => packageName.endsWith('.debugStaging');

  bool get showBanner => _isDev || _isStage;
  String get message {
    if (_isDev) return 'Dev';
    if (_isStage) return 'Stage';
    return 'Prod';
  }

  const AppVersion({
    required this.packageName,
    required this.appName,
    required this.version,
    required this.buildNumber,
  });
}

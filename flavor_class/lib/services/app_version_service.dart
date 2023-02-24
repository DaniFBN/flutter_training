import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'i_app_version_service.dart';

class AppVersionService implements IAppVersionService {
  static const _default = AppVersion(
    appName: 'Unknown',
    buildNumber: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
  );
  final ValueNotifier<AppVersion> _version = ValueNotifier(_default);

  @override
  ValueNotifier<AppVersion> get version => _version;

  AppVersionService() {
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    _version.value = AppVersion(
      appName: packageInfo.appName,
      buildNumber: packageInfo.buildNumber,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
    );
  }
}

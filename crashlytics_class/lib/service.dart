import 'dart:isolate';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  CrashlyticsService._(this._crashlytics) {
    _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  final FirebaseCrashlytics _crashlytics;
  static final instance = CrashlyticsService._(FirebaseCrashlytics.instance);

  Future<void> log(String message) async {
    await _crashlytics.log(message);
  }

  Future<void> setCustomKey(String key, Object value) async {
    await _crashlytics.setCustomKey(key, value);
  }

  Future<void> recordError(
    Object exception,
    StackTrace stackTrace, {
    bool fatal = false,
  }) async {
    await _crashlytics.recordError(exception, stackTrace, fatal: fatal);
  }

  Future<void> recordFlutterFatalError(
    FlutterErrorDetails flutterErrorDetails,
  ) async {
    await _crashlytics.recordFlutterFatalError(flutterErrorDetails);
  }

  SendPort isolateErrorListener() {
    return RawReceivePort((pair) async {
      final List errorAndStacktrace = pair;
      final exception = errorAndStacktrace[0];
      final stackTrace = errorAndStacktrace[1];

      await recordError(exception, stackTrace);
    }).sendPort;
  }
}

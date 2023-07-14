import 'dart:async';

import 'package:flutter/foundation.dart';

import '../device_info/base_device_info.dart';
import '../environment/environment.dart';
import '../logging/app_log.dart';
import 'client_report.dart';

class AppReporterClient implements ReporterClient {
  AppReporterClient({
    required this.deviceInformation,
    required this.environment,
  });

  final DeviceInformation deviceInformation;
  final Environment environment;
  final Set<ReporterErrorEvent> _events = <ReporterErrorEvent>{};

  @override
  FutureOr<void> report(
      {required StackTrace stackTrace,
      required Object error,
      Object? extra}) async {
    _events.add(
      (
        error: error,
        stackTrace: stackTrace,
        environment: environment.name.toUpperCase(),
        deviceInformation: deviceInformation.toMap(),
        extra: extra is Map
            ? extra as Map<String, dynamic>?
            : <String, dynamic>{'extra': extra},
      ),
    );
  }

  @override
  // TODO(omar): handle crash
  FutureOr<void> reportCrash(FlutterErrorDetails details) {}

  @override
  void log(Object object) => AppLog.i(object);
}

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'client_report.dart';

class NoopReporterClient implements ReporterClient {
  const NoopReporterClient();

  @override
  FutureOr<void> report(
      {required StackTrace stackTrace, required Object error, Object? extra}) {}

  @override
  FutureOr<void> reportCrash(FlutterErrorDetails details) {}

  @override
  void log(Object object) {}
}

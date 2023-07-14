import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class ReporterClient {
  FutureOr<void> report(
      {required StackTrace stackTrace, required Object error, Object? extra});

  FutureOr<void> reportCrash(FlutterErrorDetails details);

  void log(Object object);
}

typedef ReporterErrorEvent = ({
  Object error,
  StackTrace stackTrace,
  String environment,
  Map<String, String> deviceInformation,
  Map<String, dynamic>? extra,
});

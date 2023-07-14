import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl_standalone.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'analytics/base_analytics.dart';
import 'client_report/client_report.dart';
import 'device_info/base_device_info.dart';
import 'environment/app_environment.dart';
import 'environment/environment.dart';
import 'error_reporter/error_reporter.dart';
import 'logging/app_log.dart';
import 'dart:io' as io;

mainInitialzer() async {
  await Supabase.initialize(
    url: 'https://gkdguqcnmdhzfswrglgh.supabase.co',
    anonKey: 'sbp_f0d745c6164e25b573ffa0a0fbeec86f5d8bf48a',
  );
  await findSystemLocale();

  // final _Repository repository;
  late ReporterClient reporterClient;
  late Analytics analytics;
  // final NavigatorObserver navigationObserver = NavigatorObserver();
  DeviceInformation? deviceInformation;
  // await AppDeviceInformation.initialize();
  // final _ThemeModeStorage themeModeStorage =
  //     _ThemeModeStorage(await SharedPreferences.getInstance());

  await environmentHandler(
    environment,
    (
      reporterClient1,
      analytics1,
      deviceInformation1,
    ) {
      analytics = analytics1;
      reporterClient = reporterClient1;
      deviceInformation = deviceInformation1;
    },
  );

  final ErrorReporter errorReporter = ErrorReporter(client: reporterClient);
  AppLog.init(
    logFilter: () => kDebugMode && !environment.isTesting,
    exceptionFilter: (Object error) {
      const List<Type> ignoreTypes = <Type>[
        io.SocketException,
        io.HandshakeException,
        TimeoutException,
      ];
      return !kDebugMode && !ignoreTypes.contains(error.runtimeType);
    },
    onException: errorReporter.report,
    onLog: (Object? message) => debugPrint(message?.toString()),
  );
}

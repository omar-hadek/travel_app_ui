import '../analytics/base_analytics.dart';
import '../analytics/in_memory_analytics.dart';
import '../analytics/print_analytics.dart';
import '../client_report/app_client_report.dart';
import '../client_report/client_report.dart';
import '../client_report/noop_reporter_client.dart';
import '../device_info/base_device_info.dart';
import '../device_info/device_info.dart';
import 'environment.dart';

Future<void> environmentHandler(
  Environment env,
  void Function(
    ReporterClient reporterClient,
    Analytics analytics,
    DeviceInformation? deviceInformation,
  ) handleDependencies,
) async {
  // final _Repository repository;
  // final ReporterClient reporterClient;
  // final Analytics analytics;
  // final NavigatorObserver navigationObserver = NavigatorObserver();
  final DeviceInformation appDeviceInformation =
      await AppDeviceInformation.initialize();
  // final _ThemeModeStorage themeModeStorage =
  //     _ThemeModeStorage(await SharedPreferences.getInstance());
  switch (environment) {
    case Environment.dev:
      // repository = _Repository.local(
      //   Database.memory(),
      //   authIdentityStorage: const _InMemoryAuthIdentityStorage(),
      //   preferences: PreferencesLocalImpl(themeModeStorage),
      // );

      handleDependencies(
        const NoopReporterClient(),
        const PrintAnalytics(),
        appDeviceInformation,
      );
      break;
    case Environment.prod:
      // final PreferencesRepository preferences =
      //     PreferencesLocalImpl(themeModeStorage);
      // repository = _Repository.local(
      //   Database(await preferences.fetchDatabaseLocation()),
      //   authIdentityStorage:
      //       const _SecureStorageAuthIdentityStorage(FlutterSecureStorage()),
      //   preferences: preferences,
      // );
      // reporterClient = AppReporterClient(
      //   deviceInformation: deviceInformation,
      //   environment: environment,
      // );
      // analytics = InMemoryAnalytics();

      handleDependencies(
          AppReporterClient(
            deviceInformation: appDeviceInformation,
            environment: environment,
          ),
          InMemoryAnalytics(),
          null

          // deviceInformation: deviceInformation,
          );
      break;
    case Environment.testing:
    case Environment.mock:
      // seedMockData();

      // repository = _Repository.mock(themeModeStorage: themeModeStorage);

      handleDependencies(
        const NoopReporterClient(),
        const PrintAnalytics(), null,
        // deviceInformation: deviceInformation,
      );
      break;
  }
}

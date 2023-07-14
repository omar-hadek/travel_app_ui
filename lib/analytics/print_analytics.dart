import '../logging/app_log.dart';
import 'analytics_event.dart';
import 'base_analytics.dart';

class PrintAnalytics implements Analytics {
  const PrintAnalytics();

  @override
  Future<void> log(AnalyticsEvent event) async => AppLog.i(event);

  @override
  Future<void> setCurrentScreen(String name) async =>
      AppLog.i('screen_view: $name');

  @override
  Future<void> removeUserId() async {}

  @override
  Future<void> setUserId(String id) async {}
}

import 'analytics_event.dart';
import 'base_analytics.dart';

class InMemoryAnalytics implements Analytics {
  // ignore: unused_field, use_late_for_private_fields_and_variables
  String? _screenName;
  final Set<AnalyticsEvent> _events = <AnalyticsEvent>{};

  @override
  Future<void> log(AnalyticsEvent event) async => _events.add(event);

  @override
  Future<void> setCurrentScreen(String name) async => _screenName = name;

  @override
  Future<void> removeUserId() async {}

  @override
  Future<void> setUserId(String id) async {}
}

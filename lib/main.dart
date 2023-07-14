import 'package:flutter/material.dart';

import 'home_page.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void printHello() {
  print('AndroidAlarmManager called');
  runApp(const MyApp());
  // final DateTime now = DateTime.now();
  // final int isolateId = Isolate.current.hashCode;
  // print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(const MyApp());
  const int helloAlarmID = 1;
  await AndroidAlarmManager.oneShot(
      const Duration(minutes: 1),
      helloAlarmID,
      rescheduleOnReboot: true,
      printHello);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travels app',
      theme: ThemeData(
        canvasColor: const Color(0xFF17205E).withAlpha(80),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

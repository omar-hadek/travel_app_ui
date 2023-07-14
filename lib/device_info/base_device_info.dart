abstract class DeviceInformation {
  String get appName;

  String get appVersion;

  String get buildNumber;

  String get packageName;

  String? get deviceId;

  String get os;

  String? get brand;

  String? get model;

  String? get deviceVersion;

  String? get sdk;

  bool get isPhysicalDevice;

  Map<String, String> toMap();
}

enum DevicePlatform { android, ios, web }

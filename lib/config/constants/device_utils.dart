import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static Future<AndroidDeviceInfo> isAndroid() {
    var deviceInfo = DeviceInfoPlugin();
    return deviceInfo.androidInfo;
  }

  static Future<IosDeviceInfo> isIOS() {
    var deviceInfo = DeviceInfoPlugin();
    return deviceInfo.iosInfo;
  }
}

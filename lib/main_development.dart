import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:well_path/app.dart';
import 'package:well_path/bootstrap.dart';
import 'package:well_path/configs/configs_development.dart';

import 'di/locator/service_locator.dart';

void main() {
  ChuckerFlutter.showOnRelease = true;
  setupLocator(ConfigsDevelopment());
  bootstrap(() => const BodyVitalApp());
}

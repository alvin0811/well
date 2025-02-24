import 'package:well_path/app.dart';
import 'package:well_path/bootstrap.dart';
import 'package:well_path/configs/configs_production.dart';

import 'di/locator/service_locator.dart';

void main() {
  setupLocator(ConfigsProduction());
  bootstrap(() => const BodyVitalApp());
}

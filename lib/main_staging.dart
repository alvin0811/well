import 'package:well_path/app.dart';
import 'package:well_path/bootstrap.dart';
import 'package:well_path/configs/configs_staging.dart';

import 'di/locator/service_locator.dart';

void main() {
  setupLocator(ConfigsStaging());
  bootstrap(() => const BodyVitalApp());
}

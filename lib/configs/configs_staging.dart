import 'package:well_path/configs/configs.dart';

class ConfigsStaging extends BuildConfig {
  factory ConfigsStaging() => _instance;

  ConfigsStaging._();

  @override
  String get baseUrl => 'https://dev-api.wellpath.health/';

  static final _instance = ConfigsStaging._();
}

import 'package:well_path/configs/configs.dart';

class ConfigsProduction extends BuildConfig {
  factory ConfigsProduction() => _instance;

  ConfigsProduction._();

  @override
  String get baseUrl => 'https://api.wellpath.health/';

  static final _instance = ConfigsProduction._();
}

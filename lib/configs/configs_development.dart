import 'package:well_path/configs/configs.dart';

class ConfigsDevelopment extends BuildConfig {
  factory ConfigsDevelopment() => _instance;

  ConfigsDevelopment._();

  @override
  // String get baseUrl => 'https://dev-api.wellpath.health/';
  String get baseUrl => 'https://api.wellpath.health/';

  static final _instance = ConfigsDevelopment._();
}

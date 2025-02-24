import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(Environment environment) =>
    $initGetIt(getIt, environment: environment.name);

import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/homescreens/home/cubit/home_cubit.dart';
import 'package:well_path/features/homescreens/home/get_user_use_case/get_user_use_case.dart';
import 'package:well_path/features/homescreens/home/network/home_service.dart';

void setupHomeModule() {
  getIt
    ..registerFactory<HomeCubit>(() => HomeCubit(getIt<GetUserUseCase>(), getIt<AuthStore>()))
    ..registerSingleton<HomeService>(
      getIt<NetworkClient>().client.getService<DefaultHomeService>(),
    )
    ..registerFactory<GetUserUseCase>(
      () => GetUserUseCase(getIt<HomeService>()),
    );
}

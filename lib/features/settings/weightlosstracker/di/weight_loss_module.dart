import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/settings/weightlosstracker/cubit/weight_loss_cubit.dart';
import 'package:well_path/features/settings/weightlosstracker/network/weight_loss_setting_service.dart';
import 'package:well_path/features/settings/weightlosstracker/weight_loss_tracker_usecase/weight_loss_tracker_usecase.dart';

void setupWeightLossSettingModule() {
  getIt
    ..registerFactory<WeightLossSettingCubit>(() => WeightLossSettingCubit(
          getIt<WeightLossSettingUseCase>(),
        ))
    ..registerSingleton<WeightLossSettingService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultWeightLossSettingService>(),
    )
    ..registerFactory<WeightLossSettingUseCase>(
      () => WeightLossSettingUseCase(getIt<WeightLossSettingService>()),
    );
}

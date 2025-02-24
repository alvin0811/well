import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/homescreens/healthylivings/cubit/healthy_living_details_cubit.dart';

void setupHealthyLivingDetailModule() {
  getIt
    .registerFactory<HealthyLivingDetailsCubit>(
        () => HealthyLivingDetailsCubit());
}

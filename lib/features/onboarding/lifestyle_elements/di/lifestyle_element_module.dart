import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/cubit/lifestyle_element_cubit.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_lifestyle_elements_use_case/get_lifestyle_elements_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_lifestyle_element_list_use_case/get_lifestyle_element_list_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_selected_lifestyle_elements_use_case/get_selected_lifestyle_elements_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/update_lifestyle_element_use_case/update_lifestyle_element_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/update_selected_lifestyle_elements_priority_use_case/update_selected_lifestyle_elements_priority_use_case.dart';

void setupLifestyleElementModule() {
  getIt
    ..registerFactory<LifestyleElementCubit>(() => LifestyleElementCubit(
          getIt<GetLifestyleElementsUseCase>(),
          getIt<GetLifestyleElementListUseCase>(),
          getIt<UpdateLifestyleElementsUseCase>(),
          getIt<GetSelectedLifestyleElementsUseCase>(),
          getIt<UpdateSelectedLifestyleElementsPriorityUseCase>(),
        ))
    ..registerSingleton<LifestyleElementService>(
      getIt<NetworkClient>()
          .client
          .getService<DefaultLifestyleElementService>(),
    )
    ..registerFactory<GetLifestyleElementsUseCase>(
      () => GetLifestyleElementsUseCase(getIt<LifestyleElementService>()),
    )
    ..registerFactory<GetLifestyleElementListUseCase>(
      () => GetLifestyleElementListUseCase(getIt<LifestyleElementService>()),
    )
    ..registerFactory<UpdateLifestyleElementsUseCase>(
      () => UpdateLifestyleElementsUseCase(getIt<LifestyleElementService>()),
    )
    ..registerFactory<GetSelectedLifestyleElementsUseCase>(
      () =>
          GetSelectedLifestyleElementsUseCase(getIt<LifestyleElementService>()),
    )
    ..registerFactory<UpdateSelectedLifestyleElementsPriorityUseCase>(
      () => UpdateSelectedLifestyleElementsPriorityUseCase(
          getIt<LifestyleElementService>()),
    );
}

import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/notification/cubit/notification_cubit.dart';
import 'package:well_path/features/notification/network/notification_service.dart';
import 'package:well_path/features/notification/use_case/notification_use_case.dart';

void setupNotificationModule() {
  getIt
    ..registerFactory<NotificationCubit>(() => NotificationCubit(
          getIt<GetNotificationsUseCase>(),
        ))
    ..registerSingleton<NotificationService>(
      getIt<NetworkClient>().client.getService<DefaultNotificationService>(),
    )
    ..registerFactory<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(getIt<NotificationService>()),
    );
}
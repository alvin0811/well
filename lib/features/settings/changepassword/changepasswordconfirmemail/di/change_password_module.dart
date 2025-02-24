import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/change_password_usecase/change_password_usecase.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/cubit/change_password_cubit.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/change_password_service.dart';

void setupChangePasswordModule() {
  getIt
    ..registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(
        getIt<ChangePasswordUseCase>(),
        getIt<AuthStore>(),
      ),
    )
    ..registerSingleton<ChangePasswordService>(
      getIt<NetworkClient>().client.getService<DefaultChangePasswordService>(),
    )
    ..registerFactory<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(getIt<ChangePasswordService>()),
    );
}

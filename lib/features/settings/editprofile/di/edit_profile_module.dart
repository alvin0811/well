import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/settings/editprofile/cubit/edit_profile_cubit.dart';
import 'package:well_path/features/settings/editprofile/edit_profile_usecase/edit_profile_usecase.dart';
import 'package:well_path/features/settings/editprofile/get_user_profile_usecase/get_user_profile_usecase.dart';
import 'package:well_path/features/settings/editprofile/network/edit_profile_service.dart';
import 'package:well_path/features/settings/media_upload/media_uplaod_usecase/media_uplaod_usecase.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_service.dart';

void setupEditProfileModule() {
  getIt
    ..registerFactory<EditProfileCubit>(
      () => EditProfileCubit(
        getIt<EditProfileUseCase>(),
        getIt<AuthStore>(),
        getIt<MediaUploadUseCase>(),
        getIt<GetUserProfileUseCase>(),
      ),
    )
    ..registerSingleton<EditProfileService>(
      getIt<NetworkClient>().client.getService<DefaultEditProfileService>(),
    )
    ..registerSingleton<MediaUploadService>(
      getIt<NetworkClient>().client.getService<DefaultMediaUploadService>(),
    )
    ..registerFactory<EditProfileUseCase>(
      () => EditProfileUseCase(getIt<EditProfileService>()),
    )
    ..registerFactory<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(getIt<EditProfileService>()),
    )
    ..registerFactory<MediaUploadUseCase>(
      () => MediaUploadUseCase(getIt<MediaUploadService>()),
    );
}

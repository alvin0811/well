import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/editprofile/network/request/edit_profile_request.dart';
import 'package:well_path/features/settings/editprofile/network/response/edit_profile_response.dart';
import 'package:well_path/features/settings/editprofile/network/user_profile_response/user_profile_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'edit_profile_service.chopper.dart';

abstract class EditProfileService {
  Future<Response<EditProfileResponse>> editProfile(
      @Body() EditProfileRequest request);

  Future<Response<UserProfileResponse>> getUserProfile();
}

typedef EPService = EditProfileService;

@ChopperApi()
abstract class DefaultEditProfileService extends CS implements EPService {
  static DefaultEditProfileService create() => _$DefaultEditProfileService();

  @Put(path: '/v1/user')
  @override
  Future<Response<EditProfileResponse>> editProfile(
      @Body() EditProfileRequest request);

  @Get(path: '/v1/user/me')
  @override
  Future<Response<UserProfileResponse>> getUserProfile();
}

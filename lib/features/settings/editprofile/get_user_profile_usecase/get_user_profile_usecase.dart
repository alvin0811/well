import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/editprofile/network/edit_profile_service.dart';
import 'package:well_path/features/settings/editprofile/network/user_profile_response/user_profile_response.dart';

typedef ChangeUseCase = UseCase<Nothing, UserProfileResponse>;

class GetUserProfileUseCase extends ChangeUseCase {
  GetUserProfileUseCase(this._editProfileService);

  final EditProfileService _editProfileService;

  @override
  Future<Response<UserProfileResponse>> execute(Nothing params) {
    return _editProfileService.getUserProfile();
  }
}

import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/settings/editprofile/network/edit_profile_service.dart';
import 'package:well_path/features/settings/editprofile/network/request/edit_profile_request.dart';
import 'package:well_path/features/settings/editprofile/network/response/edit_profile_response.dart';

typedef ChangeUseCase = UseCase<EditProfileRequest, EditProfileResponse>;

class EditProfileUseCase extends ChangeUseCase {
  EditProfileUseCase(this._editProfileService);

  final EditProfileService _editProfileService;

  @override
  Future<Response<EditProfileResponse>> execute(
    EditProfileRequest params,
  ) {
    return _editProfileService.editProfile(params);
  }
}

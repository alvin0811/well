// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultEditProfileService extends DefaultEditProfileService {
  _$DefaultEditProfileService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultEditProfileService;

  @override
  Future<Response<EditProfileResponse>> editProfile(
      EditProfileRequest request) {
    final Uri $url = Uri.parse('/v1/user');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<EditProfileResponse, EditProfileResponse>($request);
  }

  @override
  Future<Response<UserProfileResponse>> getUserProfile() {
    final Uri $url = Uri.parse('/v1/user/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserProfileResponse, UserProfileResponse>($request);
  }
}

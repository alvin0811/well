import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  HomeResponse({required this.device, required this.user});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

  static const jsonFactory = _$HomeResponseFromJson;

  final User user;
  final Device device;
}

@JsonSerializable()
class User {
  User({
    required this.Id,
    required this.FullName,
    required this.Email,
    required this.IsFirstStepCompleted,
    required this.IsSecondStepCompleted,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const jsonFactory = _$UserFromJson;

  final int Id;
  final String FullName;
  final String Email;
  // final String? profilePictureId;
  final bool? IsFirstStepCompleted;
  final bool? IsSecondStepCompleted;
  // final bool IsOnboardingCompleted;
}

@JsonSerializable()
class Device {
  Device({required this.deviceUUID});

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  static const jsonFactory = _$DeviceFromJson;

  final String deviceUUID;
}

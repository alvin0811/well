import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  Device({
    required this.deviceUUID,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  static const jsonFactory = _$DeviceFromJson;
  @JsonKey(name: 'deviceUUID')
  final String deviceUUID;
}

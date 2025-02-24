import 'package:freezed_annotation/freezed_annotation.dart';

part 'physical_activity_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class PhysicalActivityRequest {
  PhysicalActivityRequest(
      {required this.activeTime,
      required this.haveDisability,
      required this.disabilityIds});

  factory PhysicalActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$PhysicalActivityRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PhysicalActivityRequestToJson(this);

  static const jsonFactory = _$PhysicalActivityRequestFromJson;

  final int activeTime;
  final bool? haveDisability;
  final List<int> disabilityIds;
}

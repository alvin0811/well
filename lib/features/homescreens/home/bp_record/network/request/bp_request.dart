import 'package:freezed_annotation/freezed_annotation.dart';

part 'bp_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BpRequest {
  BpRequest({
    required this.systolicBP,
    required this.diastolicBP,
    required this.pulse,
  });

  factory BpRequest.fromJson(Map<String, dynamic> json) =>
      _$BpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BpRequestToJson(this);

  static const jsonFactory = _$BpRequestFromJson;

  final int systolicBP;
  final int diastolicBP;
  final int pulse;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_lifestyle_elements_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UpdateLifestyleElementsRequest {
  UpdateLifestyleElementsRequest({required this.lifestyleIds});

  factory UpdateLifestyleElementsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLifestyleElementsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateLifestyleElementsRequestToJson(this);

  static const jsonFactory = _$UpdateLifestyleElementsRequestFromJson;

  final List<int> lifestyleIds;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lifestyle_elements_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class LifestyleElementsResponse {
  const LifestyleElementsResponse({required this.lifestyleIds});

  factory LifestyleElementsResponse.fromJson(Map<String, dynamic> json) =>
      _$LifestyleElementsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LifestyleElementsResponseToJson(this);

  static const jsonFactory = _$LifestyleElementsResponseFromJson;

  final List<int> lifestyleIds;
}

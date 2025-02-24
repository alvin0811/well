import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';

part 'get_selected_lifestyle_elements_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class GetSelectedLifestyleElementsResponse {
  const GetSelectedLifestyleElementsResponse({required this.lifeStyle});

  factory GetSelectedLifestyleElementsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSelectedLifestyleElementsResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetSelectedLifestyleElementsResponseToJson(this);

  static const jsonFactory = _$GetSelectedLifestyleElementsResponseFromJson;

  final List<SelectedLifestyleItem> lifeStyle;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class SelectedLifestyleItem {
  SelectedLifestyleItem(
      {required this.id,
      required this.userId,
      required this.lifestyleId,
      required this.priorityNumber,
      required this.lifestyleList});

  factory SelectedLifestyleItem.fromJson(Map<String, dynamic> json) =>
      _$SelectedLifestyleItemFromJson(json);
  Map<String, dynamic> toJson() => _$SelectedLifestyleItemToJson(this);

  static const jsonFactory = _$SelectedLifestyleItemFromJson;

  final int id;
  final int userId;
  final int lifestyleId;
  final int? priorityNumber;
  final LifestyleListItem lifestyleList;
}

@JsonSerializable()
class ChangeLifestyleElementPriorityResponse {
  ChangeLifestyleElementPriorityResponse({
    required this.success,
    required this.message,
  });

  factory ChangeLifestyleElementPriorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeLifestyleElementPriorityResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ChangeLifestyleElementPriorityResponseToJson(this);

  static const jsonFactory = _$ChangeLifestyleElementPriorityResponseFromJson;

  final bool? success;
  final String? message;
}

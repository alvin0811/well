import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_lifestyle_element_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class GetLifestyleElementListResponse {
  const GetLifestyleElementListResponse({required this.lifestyleList});

  factory GetLifestyleElementListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLifestyleElementListResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetLifestyleElementListResponseToJson(this);

  static const jsonFactory = _$GetLifestyleElementListResponseFromJson;

  final List<LifestyleListItem> lifestyleList;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class LifestyleListItem {
  LifestyleListItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.coverImageUrl,
      required this.isSelected});

  factory LifestyleListItem.fromJson(Map<String, dynamic> json) =>
      _$LifestyleListItemFromJson(json);
  Map<String, dynamic> toJson() => _$LifestyleListItemToJson(this);

  static const jsonFactory = _$LifestyleListItemFromJson;

  final int id;
  final String title;
  final String imageUrl;
  final bool? isSelected;
  final String coverImageUrl;
}

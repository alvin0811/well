import 'package:freezed_annotation/freezed_annotation.dart';

part 'stress_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class StressListResponse {
  const StressListResponse({
    required this.stressList,
  });

  factory StressListResponse.fromJson(Map<String, dynamic> json) =>
      _$StressListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StressListResponseToJson(this);

  static const jsonFactory = _$StressListResponseFromJson;

  final List<StressItems> stressList;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class StressItems {
  const StressItems(
      {required this.id, required this.title, this.selected = false});

  factory StressItems.fromJson(Map<String, dynamic> json) =>
      _$StressItemsFromJson(json);
  Map<String, dynamic> toJson() => _$StressItemsToJson(this);

  final int id;
  final String title;
  final bool selected;
}

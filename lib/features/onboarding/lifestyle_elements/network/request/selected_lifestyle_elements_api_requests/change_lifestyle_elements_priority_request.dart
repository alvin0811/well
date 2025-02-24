import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_lifestyle_elements_priority_request.g.dart';

@JsonSerializable()
class ChangeLifestyleElementsPriorityRequest {
  ChangeLifestyleElementsPriorityRequest({required this.data});

  factory ChangeLifestyleElementsPriorityRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeLifestyleElementsPriorityRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ChangeLifestyleElementsPriorityRequestToJson(this);

  static const jsonFactory = _$ChangeLifestyleElementsPriorityRequestFromJson;

  final List<ChangeElementPriorityRequestItem> data;
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ChangeElementPriorityRequestItem {
  ChangeElementPriorityRequestItem({
    required this.lifestyleId,
    required this.priorityNumber,
  });

  factory ChangeElementPriorityRequestItem.fromJson(
          Map<String, dynamic> json) =>
      _$ChangeElementPriorityRequestItemFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ChangeElementPriorityRequestItemToJson(this);

  static const jsonFactory = _$ChangeElementPriorityRequestItemFromJson;
  final int lifestyleId;
  final int priorityNumber;
}

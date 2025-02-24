import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';

part 'bp_category_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BPCategoryDetailsResponse {
  const BPCategoryDetailsResponse({required this.data});

  factory BPCategoryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BPCategoryDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BPCategoryDetailsResponseToJson(this);

  static const jsonFactory = _$BPCategoryDetailsResponseFromJson;

  final List<BPTrendsLineChartListItem>? data;
}



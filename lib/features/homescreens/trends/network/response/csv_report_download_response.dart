import 'package:freezed_annotation/freezed_annotation.dart';

part 'csv_report_download_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class CSVReportDownloadResponse {
  const CSVReportDownloadResponse({required this.url});

  factory CSVReportDownloadResponse.fromJson(Map<String, dynamic> json) =>
      _$CSVReportDownloadResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CSVReportDownloadResponseToJson(this);

  static const jsonFactory = _$CSVReportDownloadResponseFromJson;

  final String url;
}

import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/trends/network/request/bp_export_graph_request.dart';
import 'package:well_path/features/homescreens/trends/network/response/csv_report_download_response.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';

class DonwloadCSVReportUseCase extends UseCase<
    BloodPressureExportGraphRequest, CSVReportDownloadResponse> {
  DonwloadCSVReportUseCase(this._trendsService);

  final BPTrendsService _trendsService;

  @override
  Future<Response<CSVReportDownloadResponse>> execute(
      BloodPressureExportGraphRequest params) {
    return _trendsService.downloadCSVReport(params);
  }
}

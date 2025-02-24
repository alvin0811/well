import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/homescreens/home/bp_record/get_bp_record_list_use_case/get_bp_record_list_use_case.dart';
import 'package:well_path/features/homescreens/trends/cubit/bp_trends_cubit.dart';
import 'package:well_path/features/homescreens/trends/network/response/csv_report_download_response.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';
import 'package:well_path/features/homescreens/trends/use_cases/bp_category_details_use_case/bp_category_details_use_case.dart';
import 'package:well_path/features/homescreens/trends/use_cases/bp_trends_line_graph_use_case/bp_trends_line_graph_use_case.dart';
import 'package:well_path/features/homescreens/trends/use_cases/csv_report_downlaod_use_case/csv_report_downlaod_use_case.dart';

void setupBPTrendsModule() {
  getIt
    ..registerFactory<BPTrendsCubit>(() => BPTrendsCubit(
        getIt<BPTrendsLineGraphUseCase>(),
        getIt<BPCategoryDetailsUseCase>(),
        getIt<GetBpRecordListUseCaseNew>(),
        getIt<DonwloadCSVReportUseCase>()))
    ..registerSingleton<BPTrendsService>(
      getIt<NetworkClient>().client.getService<DefaultTrendsService>(),
    )
    ..registerFactory<BPTrendsLineGraphUseCase>(
      () => BPTrendsLineGraphUseCase(getIt<BPTrendsService>()),
    )
    ..registerFactory<BPCategoryDetailsUseCase>(
      () => BPCategoryDetailsUseCase(getIt<BPTrendsService>()),
    )
    ..registerFactory<GetBpRecordListUseCaseNew>(
      () => GetBpRecordListUseCaseNew(getIt<BPTrendsService>()),
    )
    ..registerFactory<DonwloadCSVReportUseCase>(
      () => DonwloadCSVReportUseCase(getIt<BPTrendsService>()),
    );
}

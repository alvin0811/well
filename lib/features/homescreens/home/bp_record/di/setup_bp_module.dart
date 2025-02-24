import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/homescreens/home/bp_record/bp_record_line_graph_use_case/bp_record_line_graph_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/bp_record_use_case/bp_record_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/cubit/bp_record_cubit.dart';
import 'package:well_path/features/homescreens/home/bp_record/get_bp_record_list_use_case/get_bp_record_list_use_case.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/home/bp_record/selected_bp_item_use_case/selected_bp_item_use_case.dart';

void setupBpModule() {
  getIt
    ..registerFactory<BpRecordCubit>(() => BpRecordCubit(
      getIt<BPRecordLineGraphUseCase>(),
        getIt<GetBpRecordListUseCase>(),
        getIt<BpRecordUseCase>(),
        getIt<GetSelectedItemUseCase>(),
        getIt<AuthStore>()))
    ..registerSingleton<BpRecordService>(
      getIt<NetworkClient>().client.getService<DefaultBpRecordService>(),
    )
    ..registerFactory<BPRecordLineGraphUseCase>(
      () => BPRecordLineGraphUseCase(getIt<BpRecordService>()),
    )
    ..registerFactory<GetBpRecordListUseCase>(
      () => GetBpRecordListUseCase(getIt<BpRecordService>()),
    )
    ..registerFactory<BpRecordUseCase>(
      () => BpRecordUseCase(getIt<BpRecordService>()),
    )..registerFactory<GetSelectedItemUseCase>(
      () => GetSelectedItemUseCase(getIt<BpRecordService>()),
    );
}

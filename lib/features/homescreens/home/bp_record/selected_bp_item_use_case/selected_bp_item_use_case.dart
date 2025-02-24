
import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';


class GetSelectedItemUseCase extends UseCase<Nothing, LifeStyleSelectedItem> {
  GetSelectedItemUseCase(this._bpRecordService);

  final BpRecordService _bpRecordService;

  @override
  Future<Response<LifeStyleSelectedItem>> execute(Nothing params) {
      return _bpRecordService.lifeStyleSelecteditems();
  }
}

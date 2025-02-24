import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/alert_bp_model.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';

part 'bp_trends_state.freezed.dart';

@freezed
class BPTrendState with _$BPTrendState {
  const factory BPTrendState({
    @Default([]) List<BPTrendLineGraphUiModel> bloodPressureList,
    @Default([]) List<BPTrendsBarChartListItem> bpTrendsBarChartListItem,
    @Default([]) List<BPTrendLineGraphUiModel> bpCategoryDetailList,
    @Default(0) int? systolicBp,
    @Default(0) int? diAstolicBp,
    @Default(0) int? pulse,
    @Default([]) List<BpResponse> bpResponseList,
    @Default(false) bool isAdded,
    @Default(false) bool isLoading,
    @Default(false) bool enableNext,
    @Default(false) bool isSystolicCorrect,
    @Default(false) bool isDiAstolicCorrect,
    @Default(false) bool isPulseCorrect,
    @Default(AlertBPContent(
        type: "",
        heading: "",
        description: "",
        systolic: "",
        diAstolic: "",
        categoryBp: -1))
    AlertBPContent alertBPContent,
    @Default(false) bool isShowDialogAlertBp,
  }) = _BPTrendState;

  const BPTrendState._();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/alert_bp_model.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_domain_model.dart';
import 'package:well_path/features/settings/health_facts/models/daily_facts_model.dart';

part 'bp_record_state.freezed.dart';

@freezed
class BpRecordState with _$BpRecordState {
  const factory BpRecordState({
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
    @Default(0) int? questionareInnerIndex,
    @Default(0) int? questionareAnswerInnerIndex,
    @Default(AlertBPContent(
        type: "",
        heading: "",
        description: "",
        systolic: "",
        diAstolic: "",
        categoryBp: -1))
    AlertBPContent alertBPContent,
    @Default(false) bool isShowDialogAlertBp,
    DailyFacts? dailyFact,
    @Default([]) List<BPTrendLineGraphUiModel> bloodPressureList,
    @Default([]) List<BPTrendsBarChartListItem> bpTrendsBarChartListItem,
  }) = _BpRecordState;

  const BpRecordState._();

  bool get isFormValid {
    return (isSystolicCorrect && isDiAstolicCorrect && isPulseCorrect);
  }
}

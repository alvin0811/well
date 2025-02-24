import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/helpers.dart';

part 'healthy_living_details_state.freezed.dart';

@freezed
class HealthyLivingDetailState with _$HealthyLivingDetailState {
  // const factory HomeState.data(Tabs value) = HomeStateInitial;
   factory HealthyLivingDetailState({
    @Default(false) bool isLoading,
  }) = _HealthyLivingDetailState;
  HealthyLivingDetailState._();

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;
}

import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/settings/weightlosstracker/cubit/weight_loss_navigation_enums.dart';
import 'package:well_path/features/settings/weightlosstracker/models/weight_loss_settings_state.dart';
import 'package:well_path/features/settings/weightlosstracker/weight_loss_tracker_usecase/weight_loss_tracker_usecase.dart';

import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class WeightLossSettingCubit extends Cubit<WeightLossSettingState> {
  WeightLossSettingCubit(
    this._weightLossSettingUseCase,
  ) : super(const WeightLossSettingState());

  final WeightLossSettingUseCase _weightLossSettingUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<WeightLossSettingNavigation>.broadcast();
  S<WeightLossSettingNavigation> get navigation => _navigation.stream;

  WeightLossSettingState _weightLossSettingState =
      const WeightLossSettingState();

  Future<void> getBmiCalculation() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _weightLossSettingUseCase(nothing);

    _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final bmiCalculationResponse = response.asValue!.value;
        _weightLossSettingState = state.copyWith(
            valueWeight: bmiCalculationResponse.weightLb ?? 0.0,
            bmi: bmiCalculationResponse.bmi ?? 0.0,
            idealWeight: bmiCalculationResponse.idealWeight ?? 0,
            weeklyWeightLoss: bmiCalculationResponse.weeklyGoalWeight ?? 0,
            formFieldsDataMapped: true,
            weightGain: bmiCalculationResponse.weightGain ?? 0,
            bmiGain: bmiCalculationResponse.bmiGain ?? 0);

        return emit(_weightLossSettingState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void setFormFieldsDataMapped(bool isDataMapped) {
    emit(state.copyWith(formFieldsDataMapped: isDataMapped));
  }

  void _enableNext({bool isLoading = false}) {
    emit(state.copyWith(enableNext: state.isFormValid && !isLoading));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }
}

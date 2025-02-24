import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/bmi_calculations/bmi_calculation_use_case/bmi_calculation_use_case.dart';
import 'package:well_path/features/onboarding/bmi_calculations/cubit/bmi_calculation_navigation_enums.dart';
import 'package:well_path/features/onboarding/bmi_calculations/get_bmi_calculation_use_case/get_bmi_calculation_use_case.dart';
import 'package:well_path/features/onboarding/bmi_calculations/models/bmi_calculation_state.dart';
import 'package:well_path/features/onboarding/bmi_calculations/network/request/bmi_calculation_request.dart';

import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/helper/logger/logger.dart';

class BmiCalculationCubit extends Cubit<BmiCalculationState> {
  BmiCalculationCubit(
    this._bmiCalculationUseCase,
    this._getBmiCalculationUseCase,
  ) : super(const BmiCalculationState());

  final BmiCalculationUseCase _bmiCalculationUseCase;

  final GetBmiCalculationUseCase _getBmiCalculationUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<BmiCalculationNavigation>.broadcast();
  S<BmiCalculationNavigation> get navigation => _navigation.stream;

  BmiCalculationState _bmiCalculationState = const BmiCalculationState();

  double weightInKg = 0.0;
  double heightInCentimeters = 0.0;

  inchesToCm(int ft, int inches) {
    int inchesTotal = (ft * 12) + inches;
    String cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    double cmToDouble = double.parse(cm);
    heightInCentimeters = cmToDouble / 100;
    Logger.i('$ft ft and $inches inches');
    return emit(
      state.copyWith(
        heightFt: ft,
        heightIn: inches,
        heightCm: cmToDouble,
      ),
    );
  }

  kgToLb(int kg) {
    double pounds = kg / 0.45359237;
    String lb = pounds.toStringAsPrecision(3);
    Logger.i('$kg kg and $lb lb');
    double weightLbToDouble = double.parse(lb);

    weightInKg = kg.toDouble();
    if (weightInKg != 0.0 && heightInCentimeters != 0.0) {
      calculateBMI();
    }

    return emit(
      state.copyWith(
        weightKg: kg,
        weightLb: weightLbToDouble,
      ),
    );
  }

  idealWeightKgToLb(int kg) {
    double pounds = kg / 0.45359237;
    String lb = pounds.toStringAsPrecision(3);
    Logger.i('$kg kg and $lb lb');
    double weightLbToDouble = double.parse(lb);

    return emit(
      state.copyWith(
        idealWeightKg: kg,
        idealWeightLb: weightLbToDouble,
      ),
    );
  }

  weeklyWeightKgToLb(int kg) {
    double pounds = kg / 0.45359237;
    String lb = pounds.toStringAsPrecision(3);
    Logger.i('$kg kg and $lb lb');
    double weightLbToDouble = double.parse(lb);

    return emit(
      state.copyWith(
        weeklyGoalWeightKg: kg,
        weeklyGoalWeightLb: weightLbToDouble,
      ),
    );
  }

  // void idealWeight(int value) {
  //   return emit(
  //     state.copyWith(
  //       idealWeight: value,
  //     ),
  //   );
  // }

  // void weeklyGoalWeight(int value) {
  //   return emit(
  //     state.copyWith(
  //       weeklyGoalWeight: value,
  //     ),
  //   );
  // }

  Future<void> save() async {
    calculateBMI();
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _bmiCalculationUseCase(
      BmiCalculationRequest(
        heightCm: state.heightCm,
        heightFt: state.heightFt,
        heightIn: state.heightIn,
        weightKg: state.weightKg,
        weightLb: state.weightLb,
        IdealWeight: state.idealWeightKg,
        IdealWeightLb: state.idealWeightLb,
        WeeklyGoalWeight: state.weeklyGoalWeightKg,
        WeeklyGoalWeightLb: state.weeklyGoalWeightLb,
        // idealWeight: state.idealWeight,
        // weeklyGoalWeight: state.weeklyGoalWeight,
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final bmiCalculationResponse = response.asValue!.value;

      _bmiCalculationState = state.copyWith(
        heightCm: double.parse(bmiCalculationResponse.heightCm.toString()),
        heightFt: int.parse(bmiCalculationResponse.heightFt.toString()),
        heightIn: int.parse(bmiCalculationResponse.heightIn.toString()),
        weightKg: int.parse(bmiCalculationResponse.weightKg.toString()),
        weightLb: double.parse(bmiCalculationResponse.weightLb.toString()),
        idealWeightKg: int.parse(bmiCalculationResponse.idealWeight.toString()),
        weeklyGoalWeightKg:
            int.parse(bmiCalculationResponse.weeklyGoalWeight.toString()),
        idealWeightLb:
            double.parse(bmiCalculationResponse.IdealWeightLb.toString()),
        weeklyGoalWeightLb:
            double.parse(bmiCalculationResponse.WeeklyGoalWeightLb.toString()),
        bmi: bmiCalculationResponse.bmi ?? 0.0,
        formFieldsDataMapped: true,
      );
      _navigation.sink.add(BmiCalculationNavigation.medications);
      return emit(_bmiCalculationState);
    }
  }

  void calculateBMI() {
    Logger.i('$heightInCentimeters height and $weightInKg weight');
    double bmi = (weightInKg / (heightInCentimeters * heightInCentimeters));
    String bmiInDouble = bmi.toStringAsFixed(2);
    _bmiCalculationState = state.copyWith(bmi: double.parse(bmiInDouble));
    emit(_bmiCalculationState);
  }

  Future<void> getBmiCalculation() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _getBmiCalculationUseCase(nothing);

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
        _bmiCalculationState = state.copyWith(
          heightCm: bmiCalculationResponse.heightCm ?? 0,
          heightFt: bmiCalculationResponse.heightFt ?? 0,
          heightIn: bmiCalculationResponse.heightIn ?? 0,
          weightKg: bmiCalculationResponse.weightKg ?? 0,
          weightLb: bmiCalculationResponse.weightLb ?? 0,
          idealWeightKg: bmiCalculationResponse.idealWeight ?? 0,
          weeklyGoalWeightKg: bmiCalculationResponse.weeklyGoalWeight ?? 0,
          idealWeightLb: bmiCalculationResponse.IdealWeightLb ?? 0,
          weeklyGoalWeightLb: bmiCalculationResponse.WeeklyGoalWeightLb ?? 0,
          bmi: bmiCalculationResponse.bmi ?? 0,
          formFieldsDataMapped: true,
        );

        return emit(_bmiCalculationState);
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

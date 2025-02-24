import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/onboarding/sleep/cubit/sleep_navigation_enums.dart';
import 'package:well_path/features/onboarding/sleep/get_sleep_use_case/get_sleep_use_case.dart';
import 'package:well_path/features/onboarding/sleep/models/sleep_state.dart';
import 'package:well_path/features/onboarding/sleep/network/request/sleep_request.dart';
import 'package:well_path/features/onboarding/sleep/sleep_use_case/sleep_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class SleepCubit extends Cubit<SleepState> {
  SleepCubit(this._getSleepUseCase, this._sleepUseCase)
      : super(const SleepState());

  final GetSleepUseCase _getSleepUseCase;
  final SleepUseCase _sleepUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<SleepNavigation>.broadcast();
  S<SleepNavigation> get navigation => _navigation.stream;

  final _hoursPerNightAverage = SController<int?>.broadcast();
  S<int?> get hoursPerNightAverage => _hoursPerNightAverage.stream;

  final _sleepInteruption = SController<int?>.broadcast();
  S<int?> get sleepInteruption => _sleepInteruption.stream;

  SleepState _sleepState = const SleepState();

  Future<void> save() async {
    _loader.sink.add(true);

    final response = await _sleepUseCase(
      SleepRequest(
          sleepHours: state.sleepHours,
          fellWellRested: state.fellWellRested,
          sleepSameTime: state.sleepSameTime,
          sleepInterruptions: state.sleepInterruptions,
          dayNap: state.dayNap),
    );

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final sleepResponse = response.asValue!.value;

      _sleepState = state.copyWith(
          sleepHours: sleepResponse.sleepHours,
          fellWellRested: sleepResponse.fellWellRested,
          sleepSameTime: sleepResponse.sleepSameTime,
          sleepInterruptions: sleepResponse.sleepInterruptions,
          dayNap: sleepResponse.dayNap);

      _navigation.sink.add(SleepNavigation.lifestyle);
      return emit(_sleepState);
    }
  }

  Future<void> getSleep() async {
    _loader.sink.add(true);
    final response = await _getSleepUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final sleepResponse = response.asValue!.value;

        _hoursPerNightAverage.sink.add(sleepResponse.sleepHours ?? 0);
        _sleepInteruption.sink.add(sleepResponse.sleepInterruptions ?? 0);

        _sleepState = state.copyWith(
            sleepHours: sleepResponse.sleepHours,
            fellWellRested: sleepResponse.fellWellRested,
            sleepSameTime: sleepResponse.sleepSameTime,
            sleepInterruptions: sleepResponse.sleepInterruptions,
            dayNap: sleepResponse.dayNap);
        emit(_sleepState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void onChangeAverageSleepPerWeek(int averageSleep) {
    emit(state.copyWith(sleepHours: averageSleep));
  }

  void onChangeSleepInteruption(int sleepInteruption) {
    emit(state.copyWith(sleepInterruptions: sleepInteruption));
  }

  void onClickChangeFeelRested(bool isFeelRested) {
    emit(state.copyWith(fellWellRested: isFeelRested));
  }

  void onClickChangeSleepSameTime(bool isSameSleepTime) {
    emit(state.copyWith(sleepSameTime: isSameSleepTime));
  }

  void onClickChangeNap(bool isNap) {
    emit(state.copyWith(dayNap: isNap));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    _hoursPerNightAverage.close();
    _sleepInteruption.close();
    return super.close();
  }
}

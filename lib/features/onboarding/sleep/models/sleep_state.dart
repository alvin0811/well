import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_state.freezed.dart';

@freezed
class SleepState with _$SleepState {
  const factory SleepState({
    @Default(0) int? sleepHours,
    @Default(null) bool? fellWellRested,
    @Default(null) bool? sleepSameTime,
    @Default(0) int? sleepInterruptions,
    @Default(null) bool? dayNap,
  }) = _SleepState;

  const SleepState._();
}

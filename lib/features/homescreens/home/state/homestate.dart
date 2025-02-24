import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/features/homescreens/home/state/tabs.dart';
import 'package:well_path/helper/helpers.dart';

part 'homestate.freezed.dart';

@freezed
class HomeState with _$HomeState {
  // const factory HomeState.data(Tabs value) = HomeStateInitial;
  const factory HomeState(
      {@Default(Tabs(tabValue: 0)) Tabs value,
      @Default(emptyString) String fullName,
      @Default(null) bool? isFirstStepCompleted,
      @Default(null) bool? isSecondStepCompleted,
      @Default(null) bool? isOnBoardCompleted,
      @Default(emptyString) String deviceUUID,
      @Default(emptyString) String profilePictureId}) = _HomeState;
  const HomeState._();
}

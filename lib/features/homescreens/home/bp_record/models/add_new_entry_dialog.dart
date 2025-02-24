import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_entry_dialog.freezed.dart';

@freezed
class AddNewEntryRecordState with _$AddNewEntryRecordState {
  // const factory HomeState.data(Tabs value) = HomeStateInitial;
  const factory AddNewEntryRecordState({
    @Default(false) bool isSystolicCorrect,
    @Default(false) bool isDiAstolicCorrect,
    @Default(false) bool isPulseCorrect,
    @Default(false) bool enableNext,
  }) = _AddNewEntryRecordState;

  const AddNewEntryRecordState._();

  bool get isFormValid {
    return (isSystolicCorrect && isDiAstolicCorrect && isPulseCorrect);
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/features/homescreens/home/bp_record/models/add_new_entry_dialog.dart';

class AddNewEntryCubit extends Cubit<AddNewEntryRecordState> {
  AddNewEntryCubit() : super(const AddNewEntryRecordState());

  void onSystolicChanged(String systolic) {
    debugPrint(systolic);
    if (systolic.isNotEmpty) {
      if (int.parse(systolic) > 0 && int.parse(systolic) < 301) {
         emit(state.copyWith(isSystolicCorrect: true));
        _enableNext();
      } else {
        emit(state.copyWith(isSystolicCorrect: false));
      }
    } else {
      emit(state.copyWith(isSystolicCorrect: false));
    }
    //   _enableNext();
  }

  void onDiAstolicChanged(String diAstolic) {
    debugPrint(diAstolic);
    if (diAstolic.isNotEmpty) {
      if (int.parse(diAstolic) > 0 && int.parse(diAstolic) < 201) {
        emit(state.copyWith(isDiAstolicCorrect: true));
        _enableNext();
      } else {
        emit(state.copyWith(isDiAstolicCorrect: false));
      }
    } else {
      emit(state.copyWith(isDiAstolicCorrect: false));
    }
    // _enableNext();
  }

  void onPulse(String pulse) {
    debugPrint(pulse);
    if (pulse.isNotEmpty) {
      if (int.parse(pulse) > 0 && int.parse(pulse) < 201) {
        emit(state.copyWith(isPulseCorrect: true));
        _enableNext();
      } else {
        emit(state.copyWith(isPulseCorrect: false));
      }
    } else {
      emit(state.copyWith(isPulseCorrect: false));
    }
    // _enableNext();
  }

  void _enableNext() {
    emit(state.copyWith(enableNext: state.isFormValid));
  }
}

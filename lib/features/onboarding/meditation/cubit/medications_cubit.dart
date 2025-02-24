import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';

import 'package:well_path/features/onboarding/meditation/cubit/medications_navigation_enums.dart';
import 'package:well_path/features/onboarding/meditation/get_medications_list_use_case/get_medications_list_use_case.dart';
import 'package:well_path/features/onboarding/meditation/get_medications_use_case/get_medications_use_case.dart';
import 'package:well_path/features/onboarding/meditation/medications_use_case/medications_use_case.dart';
import 'package:well_path/features/onboarding/meditation/models/medications_state.dart';
import 'package:well_path/features/onboarding/meditation/network/request/medications_request.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';

import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';
import 'package:well_path/helper/logger/logger.dart';

class MeditationCubit extends Cubit<MeditationState> {
  MeditationCubit(this._meditationUseCase, this._getMeditationUseCase,
      this._getMedicationListUseCase)
      : super(const MeditationState());

  final MeditationUseCase _meditationUseCase;
  final GetMeditationUseCase _getMeditationUseCase;
  final GetMeditationListUseCase _getMedicationListUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<MeditationNavigation>.broadcast();
  S<MeditationNavigation> get navigation => _navigation.stream;

  MeditationState _meditationState = const MeditationState();

  void onMedicationLevelChanged(int value) {
    Logger.i("onMedicationLevelChanged$value");
    emit(
      state.copyWith(medicationLevel: value),
    );
    Logger.i("onValueActivityLevelChanged$state.medicationLevel.toString()");
    _enableNext();
  }

  void onValueActivityLevelChanged(int value) {
    Logger.i("onValueActivityLevelChanged$value");
    emit(
      state.copyWith(activityLevel: value),
    );

    Logger.i("onValueActivityLevelChanged$state.activityLevel.toString()");
    _enableNext();
  }

  Future<void> save() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _meditationUseCase(
      MeditationRequest(
          medicationLevel: state.medicationLevel,
          activityLevel: state.activityLevel,
          medicationIds: state.medicationIds),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final medicationsResponse = response.asValue!.value;

      _meditationState = state.copyWith(
        activityLevel: medicationsResponse.activityLevel ?? 0,
        medicationLevel: medicationsResponse.medicationLevel ?? 0,
        formFieldsDataMapped: true,
      );
      _navigation.sink.add(MeditationNavigation.stress);
      return emit(_meditationState);
    }
  }

  Future<void> getMeditationList() async {
    _loader.sink.add(true);
    // _enableNext(isLoading: true);
    final response = await _getMedicationListUseCase(nothing);
    _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        final medicationsListResponse = response.asValue!.value;
        getMeditation(medicationsListResponse);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getMeditation(
      MedicationListResponse medicationsListResponse) async {
    _enableNext(isLoading: true);

    final response = await _getMeditationUseCase(nothing);

    _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final medicationsResponse = response.asValue!.value;

        MedicationListResponse medicationList =
            MedicationListResponse(medicationList: []);

        for (var medicationItems in medicationsListResponse.medicationList) {
          var isSelected =
              medicationsResponse.medicationIds.contains(medicationItems.id);
          medicationList.medicationList.add(MedicationItem(
              id: medicationItems.id,
              title: medicationItems.title,
              isSelected: isSelected));
        }

        _meditationState = state.copyWith(
          activityLevel: medicationsResponse.activityLevel ?? 0,
          medicationLevel: medicationsResponse.medicationLevel ?? 0,
          medicationListItems: medicationList,
          medicationIds: medicationsResponse.medicationIds,
          formFieldsDataMapped: true,
        );

        emit(_meditationState);
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void updateSelectedState(
      MedicationListResponse medicationListItems, int index) {
    MedicationListResponse medicationList =
        MedicationListResponse(medicationList: []);
    for (var i = 0; i < state.medicationListItems.medicationList.length; i++) {
      medicationList.medicationList.add(
        MedicationItem(
            id: state.medicationListItems.medicationList[i].id,
            title: state.medicationListItems.medicationList[i].title,
            isSelected: i == index
                ? !state.medicationListItems.medicationList[i].isSelected!
                : state.medicationListItems.medicationList[i].isSelected),
      );
    }

    emit(state.copyWith(medicationListItems: medicationList));
  }

  void selectedState(int indexValue, bool contains) {
    List<int> newSelectedItems = [];
    for (var i = 0; i < state.medicationIds.length; i++) {
      newSelectedItems.add(state.medicationIds[i].toInt());
    }
    if (contains) {
      newSelectedItems.remove(indexValue);
    } else {
      newSelectedItems.add(indexValue);
    }
    emit(state.copyWith(medicationIds: newSelectedItems));
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
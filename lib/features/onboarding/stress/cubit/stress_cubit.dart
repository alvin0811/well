import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/onboarding/stress/cubit/stress_navigation_enums.dart';
import 'package:well_path/features/onboarding/stress/get_stress_list_use_case/get_stress_list_use_case.dart';
import 'package:well_path/features/onboarding/stress/get_stress_use_case/get_stress_use_case.dart';
import 'package:well_path/features/onboarding/stress/models/stress_state.dart';
import 'package:well_path/features/onboarding/stress/network/request/stress_request.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/stress_use_case/stress_use_case.dart';
import 'package:well_path/features/onboarding/stress/ui/stress_page.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';

import '../../../../helper/helpers.dart';

class StressCubit extends Cubit<StressState> {
  StressCubit(
      this._getStressListUseCase, this._getStressUseCase, this._stressUseCase)
      : super(const StressState());

  final GetStressListUseCase _getStressListUseCase;
  final GetStressUseCase _getStressUseCase;
  final StressUseCase _stressUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<StressNavigation>.broadcast();
  S<StressNavigation> get navigation => _navigation.stream;

  StressState _stressState = const StressState();

  Future<void> save() async {
    _loader.sink.add(true);
    // _enableNext(isLoading: true);

    final response = await _stressUseCase(
      StressRequest(
          stressIds: state.majorStressList,
          copingMechanisms: state.copingMechanism),
    );

    _loader.sink.add(false);
    // _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final medicationsResponse = response.asValue!.value;
      _stressState = state.copyWith(
          majorStressList: medicationsResponse.stressIds,
          copingMechanism: medicationsResponse.copingMechanisms);
      _navigation.sink.add(StressNavigation.physicalactivity);
      return emit(_stressState);
    }
  }

  Future<void> getStressList() async {
    _loader.sink.add(true);
    //_enableNext(isLoading: true);
    final response = await _getStressListUseCase(nothing);
    // _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        // _loader.sink.add(false);
        final stressListResponse = response.asValue!.value;
        getStress(stressListResponse.stressList);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getStress(List<StressItems> stressItems) async {
    final response = await _getStressUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final stressResponse = response.asValue!.value;
        List<StressItems> newStressItems = [];
        List<CopingMechanism> newcopingMechanismLocalList = [];
        for (var stressItem in stressItems) {
          var isSelected = stressResponse.stressIds.contains(stressItem.id);
          newStressItems.add(StressItems(
              id: stressItem.id,
              title: stressItem.title,
              selected: isSelected));
        }

        for (var copingMechanismItem in copingMechanismLocalList) {
          var isSelected = stressResponse.copingMechanisms
              .contains(copingMechanismItem.index);
          newcopingMechanismLocalList.add(CopingMechanism(
              copingMechanismItem.index,
              copingMechanismItem.imageName,
              copingMechanismItem.imagePath,
              isSelected));
        }

        _stressState = state.copyWith(
            stressItems: newStressItems,
            majorStressList: stressResponse.stressIds,
            copingMechanismList: newcopingMechanismLocalList,
            copingMechanism: stressResponse.copingMechanisms);
        emit(_stressState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void updateStressValues(int index, int majorStressid, bool contains) {
    List<StressItems> newStressItems = [];
    for (var i = 0; i < state.stressItems!.length; i++) {
      newStressItems.add(StressItems(
          id: state.stressItems![i].id,
          title: state.stressItems![i].title,
          selected: i == index
              ? !state.stressItems![i].selected
              : state.stressItems![i].selected));
    }
    List<int> newMajorStressList = [];
    for (var i = 0; i < state.majorStressList.length; i++) {
      newMajorStressList.add(state.majorStressList[i].toInt());
    }
    if (contains) {
      newMajorStressList.remove(majorStressid);
    } else {
      newMajorStressList.add(majorStressid);
    }
    emit(state.copyWith(
        stressItems: newStressItems, majorStressList: newMajorStressList));
  }

  void updateCopingMechanismValues(int index, bool contains) {
    List<CopingMechanism> newCopingMechanismList = [];
    for (var i = 0; i < state.copingMechanismList.length; i++) {
      newCopingMechanismList.add(CopingMechanism(
          i,
          state.copingMechanismList[i].imageName,
          state.copingMechanismList[i].imagePath,
          i == index
              ? !state.copingMechanismList[i].isSelected
              : state.copingMechanismList[i].isSelected));
    }
    List<int> newCopingMechanismListInteger = [];
    for (var i = 0; i < state.copingMechanism.length; i++) {
      newCopingMechanismListInteger.add(state.copingMechanism[i].toInt());
    }
    if (contains) {
      newCopingMechanismListInteger.remove(index);
    } else {
      newCopingMechanismListInteger.add(index);
    }
    emit(state.copyWith(
        copingMechanismList: newCopingMechanismList,
        copingMechanism: newCopingMechanismListInteger));
  }

  @override
  Future<void> close() {
    _navigation.close();
    _loader.close();
    _message.close();
    return super.close();
  }

  List<CopingMechanism> copingMechanismLocalList = [
    CopingMechanism(0, "Therapy", "assets/images/ic_therapy.svg", false),
    CopingMechanism(1, "Yoga", "assets/images/ic_yoga.svg", false),
    CopingMechanism(2, "Life Coach", "assets/images/ic_lifecoach.svg", false),
    CopingMechanism(3, "Hobbies", "assets/images/ic_hobbies.svg", false),
    CopingMechanism(
        4, "Mindfulness", "assets/images/ic_mindfulness.svg", false),
    CopingMechanism(5, "Others", "assets/images/ic_others.svg", false),
  ];
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/onboarding/physical_activity/cubit/physical_activity_navigation_enums.dart';
import 'package:well_path/features/onboarding/physical_activity/get_disablilities_use_case/get_disablilities_use_case.dart';
import 'package:well_path/features/onboarding/physical_activity/get_physical_activity_use_case/get_physical_activity_use_case.dart';
import 'package:well_path/features/onboarding/physical_activity/models/physical_activity_state.dart';
import 'package:well_path/features/onboarding/physical_activity/network/request/physical_activity_request.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';
import 'package:well_path/features/onboarding/physical_activity/physical_activity_use_case/physical_activity_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class PhysicalActivityCubit extends Cubit<PhysicalActivityState> {
  PhysicalActivityCubit(this._getDisabilitiesUseCase,
      this._getPhysicalActivityUseCase, this._physicalActivityUseCase)
      : super(const PhysicalActivityState());

  final GetPhysicalActivityUseCase _getPhysicalActivityUseCase;
  final GetDisabilitiesUseCase _getDisabilitiesUseCase;
  final PhysicalActivityUseCase _physicalActivityUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<PhysicalActivityNavigation>.broadcast();
  S<PhysicalActivityNavigation> get navigation => _navigation.stream;

  final _activeTime = SController<int?>.broadcast();
  S<int?> get activeTime => _activeTime.stream;

  PhysicalActivityState _physicalActivityState = const PhysicalActivityState();

  Future<void> getDisabilitiesList() async {
    _loader.sink.add(true);
    //_enableNext(isLoading: true);
    final response = await _getDisabilitiesUseCase(nothing);
    // _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        // _loader.sink.add(false);
        final disabilitiesListResponse = response.asValue!.value;
        getDisabilities(disabilitiesListResponse.disabilityList);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getDisabilities(List<DisabilityItem> disabilityItems) async {
    final response = await _getPhysicalActivityUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final disabilityResponse = response.asValue!.value;
        _activeTime.sink.add(disabilityResponse.activeTime);
        List<DisabilityItem> newDisabilityItems = [];

        for (var disabilityItem in disabilityItems) {
          var isSelected =
              disabilityResponse.disabilityIds.contains(disabilityItem.id);
          newDisabilityItems.add(DisabilityItem(
              id: disabilityItem.id,
              title: disabilityItem.title,
              isSelected: isSelected));
        }

        _physicalActivityState = state.copyWith(
            activeTime: disabilityResponse.activeTime ?? 0,
            haveDisability: disabilityResponse.haveDisability,
            disabilityIds: disabilityResponse.disabilityIds,
            disabilityItems: newDisabilityItems);
        emit(_physicalActivityState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> save() async {
    _loader.sink.add(true);

    final response = await _physicalActivityUseCase(PhysicalActivityRequest(
        activeTime: state.activeTime,
        haveDisability: state.haveDisability,
        disabilityIds: (state.haveDisability ?? false)  ? state.disabilityIds : []));

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final physicalActivityResponse = response.asValue!.value;

      _physicalActivityState = state.copyWith(
        activeTime: physicalActivityResponse.activeTime ?? 0,
        haveDisability: physicalActivityResponse.haveDisability,
        disabilityIds: physicalActivityResponse.disabilityIds,
      );
      _navigation.sink.add(PhysicalActivityNavigation.food);
      return emit(_physicalActivityState);
    }
  }

  void setActiveTime(int time) {
    final newState = state.copyWith(activeTime: time);

    debugPrint(newState.activeTime.toString());
    emit(newState);
  }

  void updateChronic(int id) {
    final disabilityItem = state.disabilityItems
        .map((e) => e.id == id
            ? DisabilityItem(
                id: e.id, title: e.title, isSelected: !(e.isSelected ?? true))
            : e)
        .toList();
    // final disabilityIds = state.disabilityIds.toList();
    // disabilityItem[index] = DisabilityItem(
    //     id: disabilityItem[index].id,
    //     title: disabilityItem[index].title,
    //     isSelected: !(disabilityItem[index].isSelected ?? true));

    final selectedIds = disabilityItem
        .where((element) => element.isSelected ?? false)
        .map((e) => e.id)
        .toList();

    final newState = state.copyWith(
        disabilityItems: disabilityItem, disabilityIds: selectedIds);
    emit(newState);
  }

  void haveDisability() {
    final newState = state.copyWith(haveDisability: true);
    // state.disabilityItems[index].isSelected =
    //     !(state.disabilityItems[index].isSelected!);
    emit(newState);
  }

  void notDisability() {
    final disabilityItem = state.disabilityItems.toList();
    disabilityItem.map((e) => e.isSelected = false);
    final newState =
        state.copyWith(haveDisability: false, disabilityItems: disabilityItem);

    // state.disabilityItems[index].isSelected =
    //     !(state.disabilityItems[index].isSelected!);
    emit(newState);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _message.close();
    _loader.close();
    _navigation.close();
    _activeTime.close();
    return super.close();

  }
}

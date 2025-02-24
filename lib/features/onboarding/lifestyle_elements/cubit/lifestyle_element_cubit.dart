import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/cubit/lifestyle_element_navigation_enums.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/doctor/doctors.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/models/lifestyle_element_state.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/lifestyle_elements_api_requests/update_lifestyle_elements_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/request/selected_lifestyle_elements_api_requests/change_lifestyle_elements_priority_request.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_lifestyle_elements_use_case/get_lifestyle_elements_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_lifestyle_element_list_use_case/get_lifestyle_element_list_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/get_selected_lifestyle_elements_use_case/get_selected_lifestyle_elements_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/update_lifestyle_element_use_case/update_lifestyle_element_use_case.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/use_cases/update_selected_lifestyle_elements_priority_use_case/update_selected_lifestyle_elements_priority_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class LifestyleElementCubit extends Cubit<LifestyleElementState> {
  LifestyleElementCubit(this._getLifestyleElementsUseCase, this._getLifestyleElementListUseCase, this._updateLifestyleElementsUseCase,
      this._getSelectedLifestyleElementsUseCase, this._updateSelectedLifestyleElementsPriorityUseCase)
      : super(const LifestyleElementState());

  final GetLifestyleElementsUseCase _getLifestyleElementsUseCase;
  final GetLifestyleElementListUseCase _getLifestyleElementListUseCase;
  final UpdateLifestyleElementsUseCase _updateLifestyleElementsUseCase;

  final UpdateSelectedLifestyleElementsPriorityUseCase _updateSelectedLifestyleElementsPriorityUseCase;
  final GetSelectedLifestyleElementsUseCase _getSelectedLifestyleElementsUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<LifestyleElementsNavigation>.broadcast();
  S<LifestyleElementsNavigation> get navigation => _navigation.stream;

  LifestyleElementState _lifestyleElementState = const LifestyleElementState();

  Future<void> getLifestyleElementList() async {
    _loader.sink.add(true);
    //_enableNext(isLoading: true);
    final response = await _getLifestyleElementsUseCase(nothing);
    // _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        // _loader.sink.add(false);
        final lifestyleElementListResponse = response.asValue!.value;
        getLifestyleListItems(lifestyleElementListResponse.lifestyleList);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> getLifestyleListItems(List<LifestyleListItem> lifestyleListItems) async {
    final response = await _getLifestyleElementListUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final lifestyleResponse = response.asValue!.value;

        List<LifestyleListItem> newLifestyleListItems = [];

        for (var lifestyleListItem in lifestyleListItems) {
          var isSelected = lifestyleResponse.lifestyleIds.contains(lifestyleListItem.id);
          newLifestyleListItems.add(LifestyleListItem(
              id: lifestyleListItem.id,
              title: lifestyleListItem.title,
              imageUrl: lifestyleListItem.imageUrl,
              coverImageUrl: lifestyleListItem.coverImageUrl,
              isSelected: isSelected));
        }
        _lifestyleElementState = state.copyWith(lifestyleItem: newLifestyleListItems, lifestyleIds: lifestyleResponse.lifestyleIds);
        emit(_lifestyleElementState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  void updateSelectedElements(int elementId) {
    final lifestyleItem = state.lifestyleItem
        .map((e) => e.id == elementId
            ? LifestyleListItem(id: e.id, title: e.title, imageUrl: e.imageUrl, coverImageUrl: e.coverImageUrl, isSelected: !(e.isSelected ?? true))
            : e)
        .toList();

    final selectedIds = lifestyleItem.where((element) => element.isSelected ?? false).map((e) => e.id).toList();

    final newState = state.copyWith(lifestyleItem: lifestyleItem, lifestyleIds: selectedIds);
    emit(newState);
  }

  Future<void> save() async {
    _loader.sink.add(true);

    final response = await _updateLifestyleElementsUseCase(UpdateLifestyleElementsRequest(lifestyleIds: state.lifestyleIds));

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final lifestyleElementResponse = response.asValue!.value;

      _lifestyleElementState = state.copyWith(
        lifestyleIds: lifestyleElementResponse.lifestyleIds,
      );
      _navigation.sink.add(LifestyleElementsNavigation.selectedLifestyleElements);
      return emit(_lifestyleElementState);
    }
  }

  Future<void> getSelectedLifestyleElements() async {
    final response = await _getSelectedLifestyleElementsUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final lifestyleResponse = response.asValue!.value;
        final selectedElements = lifestyleResponse.lifeStyle;

        List<SelectedLifestyleItem> selectedLifestyleListItems = [];

        for (var item in selectedElements) {
          selectedLifestyleListItems.add(SelectedLifestyleItem(
              id: item.id,
              userId: item.userId,
              lifestyleId: item.lifestyleId,
              priorityNumber: item.priorityNumber,
              lifestyleList: item.lifestyleList));
        }
        _lifestyleElementState = state.copyWith(selectedLifestyleItem: selectedLifestyleListItems);
        emit(_lifestyleElementState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  Future<void> changeElementsPriority(bool isComingFromSettings, context) async {
    _loader.sink.add(true);

    List<ChangeElementPriorityRequestItem> changePriorityItems = [];

    for (var item in state.selectedLifestyleItem) {
      changePriorityItems.add(ChangeElementPriorityRequestItem(lifestyleId: item.lifestyleId, priorityNumber: item.priorityNumber ?? 0));
    }
    final response = await _updateSelectedLifestyleElementsPriorityUseCase(ChangeLifestyleElementsPriorityRequest(data: changePriorityItems));

    _loader.sink.add(false);

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final success = response.asValue!.value.success;
      _lifestyleElementState = state.copyWith(isChangeLifestyleElementsPriority: success ?? false);
      if (!isComingFromSettings) {
        // _navigation.sink.add(LifestyleElementsNavigation.home);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorPage(),
          ),
        );
      } else {
        _navigation.sink.add(LifestyleElementsNavigation.settings);
      }

      return emit(_lifestyleElementState);
    }
  }

  @override
  Future<void> close() {
    _message.close();
    _loader.close();
    _navigation.close();
    return super.close();
  }
}

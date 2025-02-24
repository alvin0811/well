import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/extensions/validation_messages.dart';
import 'package:well_path/features/authenthication/signup/models/form_field/form_field_state.dart';
import 'package:well_path/features/onboarding/demographics/cubit/demographics_navigation_enums.dart';
import 'package:well_path/features/onboarding/demographics/demographics_use_case/demographics_use_case.dart';
import 'package:well_path/features/onboarding/demographics/get_demographics_use_case/get_demographics_use_case.dart';
import 'package:well_path/features/onboarding/demographics/models/demographics_state.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class DemographicCubit extends Cubit<DemographicState> {
  DemographicCubit(
    this._authStore,
    this._demographicUseCase,
    this._getDemographicUseCase,
  ) : super(const DemographicState());

  final AuthStore _authStore;

  final DemographicUseCase _demographicUseCase;

  final GetDemographicUseCase _getDemographicUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _navigation = SController<DemographicNavigation>.broadcast();
  S<DemographicNavigation> get navigation => _navigation.stream;

  DemographicState _demographicState = const DemographicState();
  void onDateOfBirthChanged(String dateOfBirth) {
    emit(
      state.copyWith(
        dateOfBirth: state.dateOfBirth.copyWith(
          content: dateOfBirth.trim(),
          error: dateOfBirth.trim().universalError,
          showErrorIcon: true,
        ),
      ),
    );
    _enableNext();
  }

  void onGenderChanged(GenderStatus gender) {
    emit(state.copyWith(genderStatus: gender));
    _enableNext();
  }

  void onEthnicitiesChanged(EthnicityStatus ethnicity) {
    emit(state.copyWith(ethnicities: ethnicity));
    _enableNext();
  }

  Future<void> save() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _demographicUseCase(
      DemographicRequest(
        dateOfBirth: state.dateOfBirth.content,
        ethnicity: state.ethnicities,
        gender: state.genderStatus,
      ),
    );

    _loader.sink.add(false);
    _enableNext();

    if (response.isError) {
      final errorMessage = response.asError!.error as ErrorResponse;
      _message.add(CubitMessage.network(message: errorMessage.message));
      return;
    } else {
      final demographicResponse = response.asValue!.value;
      _navigation.sink.add(DemographicNavigation.bmiCalculations);
    }
  }

  Future<void> getDemographics() async {
    _loader.sink.add(true);
    _enableNext(isLoading: true);

    final response = await _getDemographicUseCase(nothing);

    _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final demographicResponse = response.asValue!.value;

        _demographicState = state.copyWith(
          dateOfBirth: FormFieldState(
            content: demographicResponse.dateOfBirth ?? emptyString,
          ),
          genderStatus: demographicResponse.gender ?? GenderStatus.male,
          ethnicities: demographicResponse.ethnicity ?? EthnicityStatus.white,
          formFieldsDataMapped: true,
        );

        return emit(_demographicState);
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

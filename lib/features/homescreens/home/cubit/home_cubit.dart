import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/homescreens/home/get_user_use_case/get_user_use_case.dart';
import 'package:well_path/features/homescreens/home/state/homestate.dart';
import 'package:well_path/features/homescreens/home/state/tabs.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getUserUseCase,
    this._authStore,
  ) : super(const HomeState());

  final GetUserUseCase _getUserUseCase;
  final AuthStore _authStore;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  final _isFirstStepCompleted = SController<bool>.broadcast();
  S<bool> get isFirstStepCompleted => _isFirstStepCompleted.stream;

  final _isSecondStepCompleted = SController<bool>.broadcast();
  S<bool> get isSecondStepCompleted => _isSecondStepCompleted.stream;

  Future<void> updateTabs(int value) async {
    emit(state.copyWith(value: Tabs(tabValue: value)));
  }

  Future<void> getUserFromAuthStore() async {
    final userResponse = await _authStore.getUser();
    if (userResponse != null) {
      return emit(
          state.copyWith(profilePictureId: userResponse.path ?? emptyString));
    }
  }

  Future<void> getUserDetails() async {
    _loader.sink.add(true);
    final response = await _getUserUseCase(nothing);

    // _enableNext();
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final userResponse = response.asValue!.value;

        if (userResponse.user.IsFirstStepCompleted! == false) {
          _isFirstStepCompleted.sink
              .add(userResponse.user.IsFirstStepCompleted!);
        } else {
          _isSecondStepCompleted.sink
              .add(userResponse.user.IsSecondStepCompleted!);
        }

        return emit(state.copyWith(
          fullName: userResponse.user.FullName,
          isFirstStepCompleted: userResponse.user.IsSecondStepCompleted,
          isSecondStepCompleted: userResponse.user.IsSecondStepCompleted,
          isOnBoardCompleted: false,
          deviceUUID: userResponse.device.deviceUUID,
        ));
      }
    } catch (e) {
      _loader.sink.add(false);
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  @override
  Future<void> close() {
    // _navigation.close();
    _loader.close();
    _message.close();
    _isFirstStepCompleted.close();
    _isSecondStepCompleted.close();
    return super.close();
  }
}

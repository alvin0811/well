import 'package:bloc/bloc.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/features/notification/models/notification_state.dart';
import 'package:well_path/features/notification/use_case/notification_use_case.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._getNotificationsUseCase)
      : super(const NotificationState());

  final GetNotificationsUseCase _getNotificationsUseCase;

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  NotificationState _notificationState = const NotificationState();

  Future<void> getNotifications() async {
    _loader.sink.add(true);

    final response = await _getNotificationsUseCase(nothing);
    try {
      if (response.isError) {
        _loader.sink.add(false);
        final errorMessage = response.asError!.error as ErrorResponse;
        _message.add(CubitMessage.network(message: errorMessage.message));
        return;
      } else {
        _loader.sink.add(false);
        final notificationResponse = response.asValue!.value;

        _notificationState = state.copyWith(
            notificationList: notificationResponse.data ?? []);
        emit(_notificationState);
      }
    } catch (e) {
      _message.add(CubitMessage.network(message: 'something went wrong'));
    }
  }

  // @override
  // Future<void> close() {
  //   _navigation.close();
  //   _loader.close();
  //   _message.close();
  //   return super.close();
  // }
}

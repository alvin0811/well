import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:well_path/app.dart';
import 'package:well_path/helper/enum/global_messages_enums.dart';

class ConnectionErrorInterceptor implements RequestInterceptor {
  ConnectionErrorInterceptor();

  final connectivity = Connectivity();

  @override
  FutureOr<Request> onRequest(Request request) async {
    final result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      globalMessageController.sink.add(GlobalMessage.internetDisconnected);
      throw TimeoutException('No internet connection');
    }
    return request;
  }
}

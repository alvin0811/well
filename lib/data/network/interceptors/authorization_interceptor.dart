import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/injectable.dart';

class AuthorizationInterceptor implements RequestInterceptor {
  final _authorizationHeader = 'authorization';

  @override
  FutureOr<Request> onRequest(Request request) async {
    final token = await getIt<AuthStore>().getToken();
    if (token != null) {
      return applyHeader(request, _authorizationHeader, token);
    }
    return request;
  }
}

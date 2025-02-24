import 'dart:async';

import 'package:chopper/chopper.dart';

import 'package:http/http.dart' as http;
import 'package:well_path/helper/logger/logger.dart';

class LoggingInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final base = await request.toBaseRequest();
    Logger.request('${base.method} ${base.url}');
    base.headers.forEach((k, v) => Logger.request('$k: $v'));

    var bytes = '';
    if (base is http.Request) {
      final body = base.body;
      if (body.isNotEmpty) {
        Logger.request(body);
        bytes = ' (${base.bodyBytes.length}-byte body)';
      }
    }

    Logger.request('END ${base.method}$bytes');
    return request;
  }
}

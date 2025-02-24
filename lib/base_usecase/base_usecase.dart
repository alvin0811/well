import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:async/async.dart';

import 'package:chopper/chopper.dart';

import 'package:flutter/foundation.dart';
import 'package:well_path/data/models/error_response/error_response.dart';
import 'package:well_path/helper/logger/logger.dart';

abstract class UseCase<Input, Output> {
  @nonVirtual
  Future<Result<Output>> call(Input params) async {
    try {
      final response = await execute(params);

      if (response.statusCode > 199 && response.statusCode < 300) {
        return Result.value(response.body as Output);
      }

      return Result.error(_convertToErrorResponse(response));
    } on Exception catch (exception, stackTrace) {
      Logger.i(stackTrace.toString());
      if (exception is TimeoutException) {
        return Result.error(
          ErrorResponse(message: exception.message.toString(), statusCode: -1),
        );
      }
      return Result.error(
        ErrorResponse(message: exception.toString(), statusCode: -1),
      );
    }
  }

  @protected
  Future<Response<Output>> execute(Input params);

  ErrorResponse _convertToErrorResponse(Response response) {
    late ErrorResponse error;

    try {
      error = ErrorResponse.fromJson(
        jsonDecode(response.bodyString) as Map<String, dynamic>,
      );
      error = ErrorResponse(
        message: error.message,
        statusCode: response.statusCode,
      );
    } catch (e) {
      error = ErrorResponse(
        message: 'Unexpected error occurred',
        statusCode: response.statusCode,
      );
    }

    return error;
  }
}

class Nothing {
  const Nothing._();
}

const nothing = Nothing._();

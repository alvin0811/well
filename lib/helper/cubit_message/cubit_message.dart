import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:well_path/helper/enum/cubit_message_enums.dart';

part 'cubit_message.freezed.dart';

@freezed
class CubitMessage with _$CubitMessage {
  factory CubitMessage.local({
    required CubitMessages message,
    @Default(false) bool? isError,
  }) = CubitMessageLocal;

  factory CubitMessage.network({
    required String message,
    @Default(true) bool? isError,
  }) = CubitMessageNetwork;
}

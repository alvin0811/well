import 'package:chopper/chopper.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:well_path/configs/configs.dart';
import 'package:well_path/data/network/interceptors/authorization_interceptor.dart';
import 'package:well_path/data/network/interceptors/connection_error_interceptor.dart';
import 'package:well_path/data/network/mappers/json_serializable_converter.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/forgot_password_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/otp_verification_service.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/reset_password_service.dart';
import 'package:well_path/features/authenthication/login/network/login_service.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/login_with_touch_id_service.dart';
import 'package:well_path/features/authenthication/signup/network/signup_service.dart';
import 'package:well_path/features/homescreens/trends/network/trends_service.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/bp_record_service.dart';
import 'package:well_path/features/homescreens/home/network/home_service.dart';
import 'package:well_path/features/notification/network/notification_service.dart';

import 'package:well_path/features/onboarding/bmi_calculations/network/bmi_calculation_service.dart';
import 'package:well_path/features/onboarding/demographics/network/demographics_service.dart';
import 'package:well_path/features/onboarding/food/network/food_service.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/lifestyle_element_service.dart';
import 'package:well_path/features/onboarding/meditation/network/medications_service.dart';
import 'package:well_path/features/onboarding/physical_activity/network/physical_activity_service.dart';
import 'package:well_path/features/onboarding/sleep/network/sleep_service.dart';
import 'package:well_path/features/onboarding/stress/network/stress_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/change_password_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/change_password_otp_service.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/setting_reset_password_service.dart';
import 'package:well_path/features/settings/editprofile/network/edit_profile_service.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_service.dart';
import 'package:well_path/features/settings/network/setting_service.dart';
import 'package:well_path/features/settings/weightlosstracker/network/weight_loss_setting_service.dart';

part 'services.dart';

class NetworkClient {
  NetworkClient(this._config);

  final BuildConfig _config;

  late final client = ChopperClient(
    baseUrl: Uri.tryParse(_config.baseUrl),
    services: _services,
    interceptors: <dynamic>[
      ChuckerHttpLoggingInterceptor(),
      ConnectionErrorInterceptor(),
      ChuckerChopperInterceptor(),
      AuthorizationInterceptor(),
    ],
    converter: JsonSerializableConverter(),
    errorConverter: JsonSerializableConverter(),
  );
}

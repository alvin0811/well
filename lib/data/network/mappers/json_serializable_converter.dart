import 'package:chopper/chopper.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/network/response/forgot_password_response.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/network/response/otp_verification_response.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/network/response/reset_password_response.dart';
import 'package:well_path/features/authenthication/login/network/response/login_response.dart';
import 'package:well_path/features/authenthication/login_with_touch/network/response/login_with_touch_id_response.dart';

import 'package:well_path/features/authenthication/signup/network/response/sign_up_response.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_category_details_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_line_graph_response.dart';
import 'package:well_path/features/homescreens/home/bp_record/network/response/bp_response.dart';
import 'package:well_path/features/homescreens/home/network/response/home_response.dart';
import 'package:well_path/features/homescreens/trends/network/response/csv_report_download_response.dart';
import 'package:well_path/features/notification/network/response/notification_list_response.dart';

import 'package:well_path/features/onboarding/bmi_calculations/network/response/bmi_calculation_response.dart';

import 'package:well_path/features/onboarding/demographics/network/response/demographics_response.dart';
import 'package:well_path/features/onboarding/food/network/response/food_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/lifestyle_elements_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';
import 'package:well_path/features/onboarding/meditation/network/response/medications_response.dart';
import 'package:well_path/features/onboarding/sleep/network/response/sleep_response.dart';
import 'package:well_path/features/onboarding/physical_activity/network/response/physical_activity_response.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_list_response.dart';
import 'package:well_path/features/onboarding/stress/network/response/stress_response.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/network/response/change_password_response.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/network/response/change_password_otp_response.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/network/response/setting_reset_password_response.dart';
import 'package:well_path/features/settings/editprofile/network/response/edit_profile_response.dart';
import 'package:well_path/features/settings/editprofile/network/user_profile_response/user_profile_response.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_finalize_response/media_upload_finalize_response.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_init_response/media_upload_init_response.dart';
import 'package:well_path/features/settings/network/delete_user_response.dart';
import 'package:well_path/features/settings/weightlosstracker/network/response/weight_loss_settings_response.dart';

part './json_factories.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  factory JsonSerializableConverter() => instance;

  const JsonSerializableConverter._();

  static const instance = JsonSerializableConverter._();

  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(
      Response response) async {
    final jsonResponse =
        await super.convertResponse<Map<String, dynamic>, InnerType>(
      response,
    );

    final jsonFactory = jsonFactories[BodyType];

    final BodyType body;
    if (jsonFactory.isNotNull) {
      body = jsonFactory!(jsonResponse.body!) as BodyType;
    } else {
      body = _decode<InnerType>(jsonResponse.body) as BodyType;
    }

    return jsonResponse.copyWith(body: body);
  }

  dynamic _decode<T>(dynamic entity) {
    if (entity is Iterable) return _decodeList<T>(entity as List);

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  T? _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = jsonFactories[T];

    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return null;
    }

    return jsonFactory(values);
  }

  List<dynamic> _decodeList<T>(List values) => values
      .where((dynamic v) => v != null)
      .map<dynamic>((dynamic v) => _decode<T>(v))
      .toList();
}

import 'package:get_it/get_it.dart';
import 'package:well_path/configs/configs.dart';
import 'package:well_path/data/network/network_client.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/forgotpassword_page/di/forgot_password_module.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/otp_verification/di/otp_verification_module.dart';
import 'package:well_path/features/authenthication/forgotpassword/ui/reset_password/di/reset_password_module.dart';
import 'package:well_path/features/authenthication/login/di/login_module.dart';
import 'package:well_path/features/authenthication/login_with_touch/di/login_with_touch_id_module.dart';
import 'package:well_path/features/authenthication/signup/di/signup_module.dart';
import 'package:well_path/features/homescreens/healthylivings/di/healthy_living_details_module.dart';
import 'package:well_path/features/homescreens/home/bp_record/di/setup_bp_module.dart';
import 'package:well_path/features/homescreens/home/di/home_module.dart';
import 'package:well_path/features/homescreens/trends/di/bp_trends_module.dart';
import 'package:well_path/features/notification/di/notification_module.dart';
import 'package:well_path/features/onboarding/bmi_calculations/di/bmi_calculation_module.dart';
import 'package:well_path/features/onboarding/demographics/di/demographics_module.dart';
import 'package:well_path/features/onboarding/food/di/food_module.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/di/lifestyle_element_module.dart';
import 'package:well_path/features/onboarding/meditation/di/medications_module.dart';
import 'package:well_path/features/onboarding/physical_activity/di/physical_activity_module.dart';
import 'package:well_path/features/onboarding/sleep/di/sleepmodule.dart';
import 'package:well_path/features/onboarding/stress/di/stress_module.dart';
import 'package:well_path/features/settings/changepassword/changepasswordconfirmemail/di/change_password_module.dart';
import 'package:well_path/features/settings/changepassword/changepasswordotp/di/change_password_otp_module.dart';
import 'package:well_path/features/settings/changepassword/changepasswordreset/di/setting_reset_password_module.dart';
import 'package:well_path/features/settings/di/settings_module.dart';
import 'package:well_path/features/settings/editprofile/di/edit_profile_module.dart';
import 'package:well_path/features/settings/weightlosstracker/di/weight_loss_module.dart';

GetIt getIt = GetIt.instance;

void setupLocator(BuildConfig config) {
  getIt
    ..registerSingleton<BuildConfig>(config)
    ..registerSingleton<NetworkClient>(NetworkClient(config));

  setupSignUpModule();
  setupLoginModule();
  setupForgotPasswordModule();
  setupResetPasswordModule();
  setupOtpVerificationModule();
  setupLoginWithTouchIdModule();
  setupDemographicModule();
  setupBmiCalculationModule();
  setupMeditationModule();
  setupStressModule();
  setupPhysicalActivityModule();
  setupChangePasswordModule();
  setupChangePasswordOtpModule();
  setupSettingResetPasswordModule();
  setupFoodModule();
  setupLifestyleElementModule();
  setupEditProfileModule();
  setupSleepModule();
  setupHomeModule();
  setupBpModule();
  setupSettingModule();
  setupBPTrendsModule();
  setupWeightLossSettingModule();
  setupHealthyLivingDetailModule();
  setupNotificationModule();
}

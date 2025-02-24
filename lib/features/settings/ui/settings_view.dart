import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:well_path/colors/colors.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/app_network_image.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/authenthication/login/ui/login_page.dart';
import 'package:well_path/features/onboarding/bmi_calculations/ui/bmi_calculation_page.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/doctor/doctors.dart';
import 'package:well_path/features/onboarding/meditation/ui/meditation_page.dart';
import 'package:well_path/features/settings/cubit/settings_cubit.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_page.dart';
import 'package:well_path/features/settings/models/settings_state.dart';
import 'package:well_path/gen/assets.gen.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';
import 'package:well_path/widgets/delete_dialog.dart';
import 'package:well_path/widgets/logout_dialog.dart';

class SettingsModel {
  String prefixIconPath;
  String title;
  Color textColor;

  SettingsModel(this.prefixIconPath, this.title, {this.textColor = Colors.black});
}

enum SettingsOptions {
  editProfile,
  editDoctor,
  healthFacts,
  bpTutorial,
  lifestyleAndPrefrences,
  bmiCalculator,
  changePassword,
  privacyPolicy,
  contactUs,
  logout,
  deleteAccount,
}

extension SettingsOptionsExtension on SettingsOptions {
  SettingsModel get option {
    switch (this) {
      case SettingsOptions.editProfile:
        return SettingsModel('assets/images/ic_setting_edit_profile.svg', 'Edit Profile');
      case SettingsOptions.editDoctor:
        return SettingsModel('assets/images/ic_setting_edit_profile.svg', 'Edit Doctor');
      case SettingsOptions.healthFacts:
        return SettingsModel('assets/images/ic_health_facts.svg', 'Health facts');
      case SettingsOptions.bpTutorial:
        return SettingsModel('assets/images/ic_setting_youtube.svg', 'How to Take BP Tutorial');
      case SettingsOptions.lifestyleAndPrefrences:
        return SettingsModel('assets/images/ic_setting_lifestyle.svg', 'Lifestyle and Preferences');
      case SettingsOptions.bmiCalculator:
        return SettingsModel('assets/images/ic_setting_bmi_calculator.svg', 'BMI Calculator');
      case SettingsOptions.changePassword:
        return SettingsModel('assets/images/ic_setting_change_password.svg', 'Change Password');
      case SettingsOptions.privacyPolicy:
        return SettingsModel('assets/images/ic_privacypolicy.svg', 'Privacy Policy');
      case SettingsOptions.contactUs:
        return SettingsModel('assets/images/ic_setting_contact_us.svg', 'Contact Us');
      case SettingsOptions.logout:
        return SettingsModel('assets/images/ic_setting_logout.svg', 'Logout');
      case SettingsOptions.deleteAccount:
        return SettingsModel('assets/images/ic_setting_delete_account.svg', 'Delete Account', textColor: const Color(0xffF10D0D));
    }
  }
}

List<SettingsOptions> settingsList() {
  List<SettingsOptions> options = [];
  for (var option in SettingsOptions.values) {
    options.add(option);
  }

  return options;
}

class SettingsPage extends StatefulWidget {
  static const route = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with Loading, Message {
  late final _cubit = context.read<SettingCubit>();
  late final authStore = AuthStore();
  @override
  void initState() {
    super.initState();
    _cubit.getUserFromAuthStore();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _initNavigationListener();
  }

  void _initNavigationListener() {
    _cubit.deleteAccountNavigation.listen((event) {
      _moveToLoginPage();
    });
  }

  void _moveToLoginPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.route, (Route<dynamic> route) => false);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Support@wellpath.health',
      query: encodeQueryParameters(<String, String>{'subject': 'App Inquiry'}),
    );

    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop("1");
          },
        ),
      ),
      body: BlocBuilder<SettingCubit, SettingState>(builder: (
        context,
        state,
      ) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  state.userImage.isNotNull && state.userImage.isNotEmpty
                      ? ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: AppNetworkImage(
                            state.userImage,
                            height: 130,
                            width: 130,
                          ),
                        )
                      : SvgPicture.asset(
                          Assets.images.icProfilePlaceholderSvg,
                          width: 100,
                          height: 100,
                        ),
                  const SizedBox(height: 10),
                  Text(
                    state.userName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
                  ),
                  Text(
                    state.userEmail,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, color: const Color(0xff235564)),
                  ),
                  const SizedBox(height: 26),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(5),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        var data = settingsList()[index];
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                color: Color(0xFFD0D0D0),
                                blurRadius: 2.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  0.5, // Move to right 5  horizontally
                                  0.5, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              switch (data) {
                                case SettingsOptions.editProfile:
                                  Navigator.of(context).pushNamed('/edit-profile');
                                  break;
                                case SettingsOptions.editDoctor:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorPage(),
                                    ),
                                  );
                                  break;
                                case SettingsOptions.healthFacts:
                                  context.navigator.pushNamed(HealthFactsPage.route);
                                  break;
                                case SettingsOptions.bpTutorial:
                                  Navigator.of(context).pushNamed('/bptutorialone');
                                  break;
                                case SettingsOptions.lifestyleAndPrefrences:
                                  getIt<AuthStore>().setIsComingFromSettings(true);
                                  context.navigator.pushNamed(MeditationPage.route);
                                  break;
                                case SettingsOptions.bmiCalculator:
                                  authStore.setIsComingFromSettings(true);
                                  Navigator.of(context).pushNamed(BmiCalculationPage.route);
                                  break;
                                case SettingsOptions.changePassword:
                                  Navigator.of(context).pushNamed("/change-password");
                                  break;
                                case SettingsOptions.privacyPolicy:
                                  _launchUrl(Uri.parse("https://wellpath.health/privacy-policy"));
                                  // Navigator.of(context)
                                  //     .pushNamed("/privacy-policy");
                                  break;
                                case SettingsOptions.deleteAccount:
                                  showDeleteAccountDialog(
                                    context,
                                    title: "Are you sure you want to delete your account? You will lose all your data!",
                                    primaryButtonText: "Yes",
                                    secondaryButtonText: "No",
                                    onSecondaryPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    onPrimaryPressed: () async {
                                      _cubit.deleteUser();
                                    },
                                  );
                                  break;
                                case SettingsOptions.logout:
                                  showLogoutDialog(
                                    context,
                                    title: "Are you sure you want to logout?",
                                    primaryButtonText: "Yes",
                                    secondaryButtonText: "No",
                                    onSecondaryPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    onPrimaryPressed: () async {
                                      await authStore.signOut();
                                      _moveToLoginPage();
                                    },
                                  );
                                  break;
                                case SettingsOptions.contactUs:
                                  _launchEmail();
                                  break;
                                default:
                                  break;
                              }
                            },
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SvgPicture.asset(
                                data.option.prefixIconPath,
                              ),
                            ),
                            title: Text(
                              data.option.title,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: data.option.textColor, fontSize: 16),
                            ),
                            minLeadingWidth: 10,
                            contentPadding: EdgeInsets.zero,
                            trailing: SvgPicture.asset(
                              'assets/images/ic_setting_detail_arrow_right.svg',
                            ),
                          ),
                        );
                      },
                      itemCount: settingsList().length,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../colors/colors.dart';
import '../../../../common/constants.dart';
import '../../../../common/expended_scroll_view.dart';
import '../../../../corewidgets/app_bar_back_button.dart';
import '../../../../corewidgets/app_network_image.dart';
import '../../../../corewidgets/app_text_field.dart';
import '../../../../corewidgets/custom_container_widget.dart';
import '../../../../corewidgets/well_path_app_bar.dart';
import '../../../../corewidgets/wellpathbutton.dart';
import '../../../../extensions/extensions.dart';
import '../../../../helper/helpers.dart';
import '../../../../helper/mixins/loading_mixin.dart';
import '../../../../helper/mixins/show_message_mixin.dart';
import '../../ui/settings_view.dart';
import '../cubit/edit_profile_cubit.dart';
import '../cubit/edit_profile_navigation.dart';
import '../models/edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  static const route = '/edit-profile';
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>
    with Loading, Message {
  final picker = ImagePicker();

  late final _cubit = context.read<EditProfileCubit>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _phoneNumberFormatter = MaskTextInputFormatter(
    mask: mask,
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  @override
  void initState() {
    super.initState();

    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);

    _cubit.getUserFromAuthStore();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case EditProfileNavigation.settings:
          _navigateToSettingPage();
          break;
      }
    });
  }

  void _navigateToSettingPage() {
    context.navigator.pop();
    context.navigator.pop();
    context.navigator.pop();
    // context.navigator.popUntil((route) => false);
    context.navigator.pushNamed(SettingsPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            if (state.formFieldsDataMapped) {
              _nameController.text = state.name.content;
              _emailController.text = state.email.content;
              _phoneController.text = state.phone.content;

              _cubit.setFormFieldsDataMapped(false);
            }
            return SafeArea(
              child: ExpandedScrollView(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        _showPicker(context: context);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: state.images?.map(
                              local: (file) => Image.file(
                                File(file.filePath),
                                height: 130,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                              network: (networkImage) => AppNetworkImage(
                                networkImage.url,
                                height: 130,
                                width: 130,
                                errorWidget: ShadowContainerWidget(
                                  height: double.infinity,
                                  radius: 20,
                                  color: Colors.white70,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/ic_profile_placeholder.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(64),
                              child: Container(
                                color: appPrimaryColor.withOpacity(0.6),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/ic_upload_profile_image.svg',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox.square(dimension: 16),
                    AppTextField(
                      textEditingController: _nameController,
                      hintText: 'Name',
                      error: state.name.error.toLocalizedString(context),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SvgPicture.asset(
                          'assets/images/icon_person.svg',
                          width: 10,
                          height: 10,
                        ),
                      ),
                      onChanged: _cubit.onNameChanged,
                      inputType: TextInputType.name,
                      obscureText: false,
                      action: TextInputAction.next,
                      suffixIcon: null,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      textEditingController: _emailController,
                      error: state.email.error.toLocalizedString(context),
                      hintText: 'Email Address',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: SvgPicture.asset(
                          'assets/images/ic_email.svg',
                          width: 5,
                          height: 5,
                        ),
                      ),
                      suffixIcon: null,
                      inputType: TextInputType.emailAddress,
                      onChanged: _cubit.onEmailChanged,
                      action: TextInputAction.next,
                      obscureText: false,
                      textFieldEnabled: true,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      textEditingController: _phoneController,
                      error: state.phone.error.toLocalizedString(context),
                      hintText: 'Phone Number',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: SvgPicture.asset(
                          'assets/images/icon_phone.svg',
                          width: 10,
                          height: 10,
                        ),
                      ),
                      suffixIcon: null,
                      inputType: TextInputType.phone,
                      //   textInputFormatter: [_phoneNumberFormatter],
                      onChanged: _cubit.onPhoneChanged,
                      obscureText: false,
                      action: TextInputAction.done,
                    ),
                    const SizedBox.square(dimension: 38),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WellPathButton(
                          onPressed:
                              state.enableNext ? _cubit.saveProfile : null,
                          buttonText: "Save Changes",
                        ),
                      ),
                    ),
                    const SizedBox.square(dimension: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(
      source: img,
      imageQuality: imageQuality,
    );
    XFile? filePick = pickedFile;
    if (filePick != null) {
      _cubit.uploadMedia(
        File(filePick.path),
      );
    } else {
      BotToast.showText(text: 'Nothing is selected');
    }
  }
}

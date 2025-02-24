import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/onboarding/bmi_calculations/ui/bmi_calculation_page.dart';
import 'package:well_path/features/onboarding/demographics/cubit/demographics_cubit.dart';
import 'package:well_path/features/onboarding/demographics/cubit/demographics_navigation_enums.dart';
import 'package:well_path/features/onboarding/demographics/models/demographics_state.dart';
import 'package:well_path/features/onboarding/demographics/network/request/demographics_request.dart';
import 'package:well_path/helper/logger/logger.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

List<String> selectedTags = [];

class Ethnicity {
  final EthnicityStatus id;
  final String name;

  Ethnicity({required this.id, required this.name});
}

List<Ethnicity> ethnicities = [
  Ethnicity(id: EthnicityStatus.white, name: "White"),
  Ethnicity(id: EthnicityStatus.africanAmerican, name: "African American"),
  Ethnicity(id: EthnicityStatus.asian, name: "Asian"),
  Ethnicity(
      id: EthnicityStatus.americanIndian,
      name: "American Indian / Alaska Native"),
  Ethnicity(id: EthnicityStatus.nativeHawaiian, name: "Native Hawaiian"),
  Ethnicity(id: EthnicityStatus.other, name: "Other"),
];

extension CatExtension on GenderStatus {
  String get name {
    switch (this) {
      case GenderStatus.male:
        return 'Male';
      case GenderStatus.feMale:
        return 'Female';
      case GenderStatus.others:
        return 'Others';
      default:
        return '';
    }
  }

  String get iconPath {
    switch (this) {
      case GenderStatus.male:
        return 'assets/images/ic_male.svg';
      case GenderStatus.feMale:
        return 'assets/images/ic_female.svg';
      case GenderStatus.others:
        return 'assets/images/ic_other_gender.svg';
      default:
        return '';
    }
  }
}

class DemographicPage extends StatefulWidget {
  static const route = '/demographics';
  const DemographicPage({Key? key}) : super(key: key);

  @override
  State<DemographicPage> createState() => _DemographicPageState();
}

class _DemographicPageState extends State<DemographicPage>
    with Loading, Message {
  GenderStatus _value = GenderStatus.male;

  final TextEditingController _dateinput = TextEditingController();
  late final _cubit = context.read<DemographicCubit>();
  late final authStore = AuthStore();
  DateTime today = DateTime.now();
  String formattedDate = '';
  @override
  void initState() {
    super.initState();
    _dateinput.text = "";
    formattedDate = DateFormat('dd/MM/yyyy').format(today);
    _initNavigationListener();
    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getDemographics();
  }

  void _initNavigationListener() {
    _cubit.navigation.listen((event) {
      switch (event) {
        case DemographicNavigation.bmiCalculations:
          _navigateToBmiCalculations();
          break;
      }
    });
  }

  void _navigateToBmiCalculations() {
    authStore.setIsComingFromSettings(false);
    context.navigator.pushNamed(BmiCalculationPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemographicCubit, DemographicState>(
      builder: (context, state) {
        if (state.formFieldsDataMapped) {
          if (state.dateOfBirth.content.isNotEmpty) {
            _dateinput.text = dateFormatInUi(state.dateOfBirth.content);
          } else {
            _dateinput.text = formattedDate;
          }

          _value = state.genderStatus;

          _cubit.setFormFieldsDataMapped(false);
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const WellPathAppBar(),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Step 1 of 8',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: const Color(0xff4AB7C3))),
                              Text('Demographics',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 12),
                              genderQuestionnaireWidget(),
                              const SizedBox(height: 22),
                              dateOfBirthWidget(),
                              const SizedBox(height: 22),
                              Text('Ethnicity?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: const Color(0xff4AB7C3))),
                              EthnicitySelectionWidget(
                                ethnicities: ethnicities,
                                initialEthnicity:
                                    _toEthnicity(state.ethnicities),
                                onEthnicitySelected: (ethnic) {
                                  _cubit.onEthnicitiesChanged(ethnic!.id);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: WellPathButton(
                          buttonText: 'Save & Continue',
                          onPressed: () => _cubit.save(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Ethnicity _toEthnicity(EthnicityStatus status) {
    return ethnicities.firstWhere(
      (e) => e.id == status,
      orElse: () => ethnicities.first,
    );
  }

  Widget genderQuestionnaireWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What is your sex?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xff4AB7C3))),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MyRadioListTile<GenderStatus>(
                value: GenderStatus.male,
                groupValue: _value,
                leading: GenderStatus.male.name,
                imageUrl: GenderStatus.male.iconPath,
                title: Text(GenderStatus.male.name),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    _cubit.onGenderChanged(value);
                  });
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: MyRadioListTile<GenderStatus>(
                value: GenderStatus.feMale,
                groupValue: _value,
                leading: GenderStatus.feMale.name,
                imageUrl: GenderStatus.feMale.iconPath,
                title: Text(GenderStatus.feMale.name),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    _cubit.onGenderChanged(value);
                  });
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: MyRadioListTile<GenderStatus>(
                value: GenderStatus.others,
                groupValue: _value,
                leading: GenderStatus.others.name,
                imageUrl: GenderStatus.others.iconPath,
                title: Text(GenderStatus.others.name),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    _cubit.onGenderChanged(value);
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  String dateFormatInUi(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dt);
  }

  Widget dateOfBirthWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date of Birth?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xff4AB7C3))),
        const SizedBox(height: 8),
        Container(
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD0D0D0),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    0.5, // Move to right 5  horizontally
                    0.5, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _dateinput,
              onChanged: _cubit.onDateOfBirthChanged,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/images/icon_calendar.svg',
                      width: 18,
                      height: 18,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: formattedDate,
                  hintStyle: const TextStyle(color: Colors.grey)),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      1900), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0XFF4AB7C3),
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color(0XFF4AB7C3), // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (pickedDate != null) {
                  Logger.e(pickedDate
                      .toString()); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('MM/dd/yyyy').format(pickedDate);
                  String dateOfBirth =
                      DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(pickedDate);
                  Logger.e(formattedDate);
                  _cubit.onDateOfBirthChanged(dateOfBirth);

                  setState(() {
                    _dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  Logger.e("Date is not selected");
                  BotToast.showText(text: "Date is not selected");
                }
              },
            )),
      ],
    );
  }
}

class EthnicityTagWidget extends StatelessWidget {
  final String title;
  const EthnicityTagWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        // alignment: Alignment.center,
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD0D0D0),
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
            )
          ],
        ),
        child: Text(title));
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final String imageUrl;
  final Widget? title;
  final ValueChanged<T> onChanged;

  const MyRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    required this.imageUrl,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    var isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isSelected ? const Color(0XFF4AB7C3) : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFD0D0D0),
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  0.5, // Move to right 5  horizontally
                  0.5, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: _customRadioButton,
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            imageUrl,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : const Color(0XFFA9A9A9),
                BlendMode.srcIn),
          ),
          // SizedBox(width: 8),
          Text(leading,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[600]!,
              )),
        ],
      ),
    );
  }
}

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({super.key});

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text =
            pickedDate.toString(); // You can format the date here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      onTap: () {
        FocusScope.of(context)
            .requestFocus(FocusNode()); // Remove keyboard when tapped
        _selectDate(context);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Select a date',
        contentPadding: const EdgeInsets.all(16.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
          // Adding light box shadow
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey[200],
          //     blurRadius: 5.0,
          //     spreadRadius: 1.0,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
      ),
    );
  }
}

class EthnicitySelectionWidget extends StatefulWidget {
  final List<Ethnicity> ethnicities;
  final Function(Ethnicity?) onEthnicitySelected;
  final Ethnicity initialEthnicity;

  const EthnicitySelectionWidget({
    Key? key,
    required this.ethnicities,
    required this.onEthnicitySelected,
    required this.initialEthnicity,
  }) : super(key: key);

  @override
  State<EthnicitySelectionWidget> createState() =>
      _EthnicitySelectionWidgetState();
}

class _EthnicitySelectionWidgetState extends State<EthnicitySelectionWidget> {
  @override
  Widget build(BuildContext context) {
    late Ethnicity? selectedEthnicity = widget.initialEthnicity;
    return Wrap(
      children: [
        for (var ethnicity in ethnicities)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedEthnicity = ethnicity;
                widget.onEthnicitySelected(selectedEthnicity);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: (selectedEthnicity == ethnicity)
                      ? const Color(0XFF4AB7C3)
                      : Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFD0D0D0),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22.0, top: 8, right: 22, bottom: 8),
                  child: Text(
                    ethnicity.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: (selectedEthnicity == ethnicity)
                            ? Colors.white
                            : const Color(0xFFA9A9A9)),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

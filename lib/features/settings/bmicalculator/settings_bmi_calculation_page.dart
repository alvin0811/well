import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../corewidgets/wellpathbutton.dart';
import '../../../corewidgets/app_bar_back_button.dart';
import '../../../corewidgets/well_path_app_bar.dart';

class SettingsBmiCalculationPage extends StatefulWidget {
  const SettingsBmiCalculationPage({Key? key}) : super(key: key);

  @override
  State<SettingsBmiCalculationPage> createState() =>
      _SettingsBmiCalculationPageState();
}

class _SettingsBmiCalculationPageState
    extends State<SettingsBmiCalculationPage> {
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
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_onboard.png",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text('BMI Calculation',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        const SizedBox(height: 12),
                        // height picker view
                        Text('Select Height',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xff4AB7C3))),
                        const SizedBox(height: 12),
                        const Height(),
                        const SizedBox(height: 22),
                        // Weight Picker View
                        Text('Select Weight',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xff4AB7C3))),
                        const SizedBox(height: 12),
                        const Weight(),
                        const SizedBox(height: 22),
                        Align(
                            alignment: Alignment.center,
                            child: bmiResultWidget()),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: WellPathButton(
                    buttonText: 'Save & Continue',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget bmiResultWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('BMI Result',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xff4AB7C3))),
        const SizedBox(height: 8),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/ic_bmi_result.svg',
              width: 240,
              height: 240,
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your BMI is',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12),
                    ),
                    Text(
                      '27.6',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 30, color: const Color(0XFF235564)),
                    ),
                    Text(
                      'Normal',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12, color: const Color(0XFF235564)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

enum HeightUnit { ft, cm }

class Height extends StatefulWidget {
  const Height({super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  HeightUnit selectedUnit = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  int ft = 0;
  int inches = 0;
  String cm = '';

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    debugPrint('$ft feet and $inches inches');
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    heightController.text = cm;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        heightController.text = '$ft ft $inches In';
      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        debugPrint(heightController.text);
        inchesToCm();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: selectedUnit == HeightUnit.ft
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: Colors.grey[350],
                            child: Row(
                              children: [
                                Expanded(
                                  // flex: 3,
                                  child: CupertinoPicker(
                                    itemExtent: 32.0,
                                    onSelectedItemChanged: (int index) {
                                      print(index + 1);
                                      setState(() {
                                        inchesToCm();
                                        ft = (index + 1);
                                        heightController.text =
                                            "$ft ft $inches In";
                                      });
                                    },
                                    children: List.generate(12, (index) {
                                      return Center(
                                        child: Text('${index + 1}'),
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                    // flex: 1,
                                    child: Center(
                                        child: Text('ft',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge))),
                                Expanded(
                                  child: CupertinoPicker(
                                    itemExtent: 32.0,
                                    onSelectedItemChanged: (int index) {
                                      print(index);
                                      setState(() {
                                        inchesToCm();
                                        inches = (index);
                                        heightController.text =
                                            "$ft ft $inches In";
                                      });
                                    },
                                    children: List.generate(12, (index) {
                                      return Center(
                                        child: Text('$index'),
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                  // flex: 1,
                                  child: Center(
                                      child: Text('inches',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                )
                              ],
                            ),
                          );
                        });
                  }
                : null,
            child: Container(
                alignment: Alignment.center,
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
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: inches == 0 ? '__ ' : '$ft ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: const Color(0XFFA9A9A9),
                                    fontSize: 24)),
                        TextSpan(
                            text: 'ft',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: const Color(0XFFA9A9A9),
                                    fontSize: 16,
                                    fontFeatures: [
                                  const FontFeature.subscripts()
                                ])),
                      ]),
                    ),
                    Container(
                      color: const Color(0XFFA9A9A9),
                      width: 1,
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: inches == 0 ? '__ ' : '$inches ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: const Color(0XFFA9A9A9),
                                    fontSize: 24)),
                        TextSpan(
                            text: 'In',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: const Color(0XFFA9A9A9),
                                    fontSize: 16,
                                    fontFeatures: [
                                  const FontFeature.subscripts()
                                ])),
                      ]),
                    ),
                  ],
                )

                // TextFormField(
                //   onTap: selectedUnit == HeightUnit.ft
                //       ? () {
                //           FocusScope.of(context).requestFocus(FocusNode());
                //           showCupertinoModalPopup(
                //               context: context,
                //               builder: (context) {
                //                 return Container(
                //                   height: 200,
                //                   color: Colors.grey[350],
                //                   child: Row(
                //                     children: [
                //                       Expanded(
                //                         flex: 3,
                //                         child: CupertinoPicker(
                //                           itemExtent: 32.0,
                //                           onSelectedItemChanged: (int index) {
                //                             print(index + 1);
                //                             setState(() {
                //                               ft = (index + 1);
                //                               heightController.text =
                //                                   "$ft ft $inches In";
                //                             });
                //                           },
                //                           children: List.generate(12, (index) {
                //                             return Center(
                //                               child: Text('${index + 1}'),
                //                             );
                //                           }),
                //                         ),
                //                       ),
                //                       Expanded(
                //                           flex: 1,
                //                           child: Center(
                //                               child: Text('ft',
                //                                   style: Theme.of(context)
                //                                       .textTheme
                //                                       .headlineSmall))),
                //                       Expanded(
                //                         child: CupertinoPicker(
                //                           itemExtent: 32.0,
                //                           onSelectedItemChanged: (int index) {
                //                             print(index);
                //                             setState(() {
                //                               inches = (index);
                //                               heightController.text =
                //                                   "$ft ft $inches In";
                //                             });
                //                           },
                //                           children: List.generate(12, (index) {
                //                             return Center(
                //                               child: Text('$index'),
                //                             );
                //                           }),
                //                         ),
                //                       ),
                //                       Expanded(
                //                         flex: 3,
                //                         child: Center(
                //                             child: Text('inches',
                //                                 style: TextStyle(
                //                                   decoration: TextDecoration.none,
                //                                   fontSize: 16,
                //                                   color: Colors.black,
                //                                 ))),
                //                       )
                //                     ],
                //                   ),
                //                 );
                //               });
                //         }
                //       : null,
                //   controller: heightController,
                //   keyboardType: TextInputType.number,
                //   textAlign: TextAlign.center,
                //   cursorColor: Color(0xFF4C4ED7),
                //   decoration: InputDecoration(
                //       hintText:
                //           selectedUnit == HeightUnit.ft ? "__ ft __ In" : '__',
                //       hintStyle: TextStyle(color: Color(0xFF4C4ED7)),
                //       enabledBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent)),
                //       focusedBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.transparent))),
                //   inputFormatters: [
                //     FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                //   ],
                // ),
                ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
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
            height: 70,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: inches == 0 ? '__ ' : '$cm ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFFD0D0D0), fontSize: 24)),
                TextSpan(
                    text: 'cm',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFFD0D0D0),
                        fontSize: 16,
                        fontFeatures: [const FontFeature.subscripts()])),
              ]),
            ),
          ),
        ),
      ],
    ));
  }
}

enum WeightUnit { kg, lb }

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  WeightUnit selectedUnit = WeightUnit.kg;
  TextEditingController weightController = TextEditingController();
  int ft = 0;
  int kg = 0;
  String lb = '';

  kgToLb() {
    double pounds = kg / 0.45359237;
    lb = pounds.toStringAsPrecision(3);
    print('$kg kg and $lb lb');
  }

  // cmToInches(inchess) {
  //   ft = inchess ~/ 12;
  //   inches = inchess % 12;
  //   print('$ft feet and $inches inches');
  // }

  // inchesToCm() {
  //   int inchesTotal = (ft * 12) + inches;
  //   cm = (inchesTotal * 2.54).toStringAsPrecision(5);
  //   heightController.text = cm;
  // }

  // void checkWeightUnit() {
  //   if (selectedUnit == HeightUnit.ft) {
  //     setState(() {
  //       int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
  //       cmToInches(inchess);
  //       heightController.text = '$ft ft $inches In';
  //     });
  //   } else if (selectedUnit == HeightUnit.cm) {
  //     setState(() {
  //       print(heightController.text);
  //       inchesToCm();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: selectedUnit == WeightUnit.kg
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: Colors.grey[350],
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CupertinoPicker(
                                    itemExtent: 32.0,
                                    onSelectedItemChanged: (int index) {
                                      print(index + 1);
                                      setState(() {
                                        // inchesToCm();
                                        kg = (index + 1);
                                        kgToLb();
                                        // weightController.text = "$kg";
                                      });
                                    },
                                    children: List.generate(200, (index) {
                                      return Center(
                                        child: Text('${index + 1}'),
                                      );
                                    }),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text('Kg',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge))),
                              ],
                            ),
                          );
                        });
                  }
                : null,
            child: Container(
                alignment: Alignment.center,
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
                width: 160,
                height: 70,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: kg == 0 ? '__ ' : '$kg ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0XFFA9A9A9), fontSize: 24)),
                    TextSpan(
                        text: 'Kg',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0XFFA9A9A9),
                                fontSize: 16,
                                fontFeatures: [
                              const FontFeature.subscripts()
                            ])),
                  ]),
                )),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Container(
            alignment: Alignment.center,
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
            width: 160,
            height: 70,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '$lb ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFFD0D0D0), fontSize: 24)),
                TextSpan(
                    text: 'lb',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFFD0D0D0),
                        fontSize: 16,
                        fontFeatures: [const FontFeature.subscripts()])),
              ]),
            ),
          ),
        ),
      ],
    ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/onboarding/bmi_calculations/ui/bmi_calculation_page.dart';
import '../global_keys.dart';
import '../wellpathbutton.dart';

class BMIResultWidget extends StatefulWidget {
  const BMIResultWidget({
    required this.idealWeight,
    required this.weeklyGoalWeight,
    super.key,
  });
  final String idealWeight;
  final String weeklyGoalWeight;

  @override
  State<BMIResultWidget> createState() => _BMIResultWidget();
}

class _BMIResultWidget extends State<BMIResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox.square(dimension: 20),
        Text('Your Ideal Weight',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: const Color(0xFF4AB7C3))),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/ic_bmi_result.svg',
              width: 300,
              height: 300,
            ),
            Positioned.fill(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: widget.idealWeight,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: const Color(0XFF235564),
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'lbs',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0XFF235564),
                                    fontSize: 20,
                                    fontFeatures: [
                                  const FontFeature.subscripts()
                                ],)),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Text(
          "Your weekly weight loss goal",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: const Color(0xFF4AB7C3)),
        ),
        const SizedBox.square(dimension: 6),
        Text(
          "${widget.weeklyGoalWeight} lbs",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox.square(dimension: 20),
        WellPathButton(
          onPressed: () {
            navigatorKey.currentState?.pushNamed(BmiCalculationPage.route);
          },
          buttonText: 'Update BMI',
        ),
        const SizedBox.square(dimension: 40),
      ]),
    );
  }
}

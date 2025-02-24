import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BmiResultWidget extends StatefulWidget {
  BmiResultWidget({
    super.key,
    required this.bmi,
  });
  double bmi = 0.0;
  @override
  State<BmiResultWidget> createState() => _BmiResultWidgetState();
}

class _BmiResultWidgetState extends State<BmiResultWidget> {
  String bmiResult() {
    if (widget.bmi < 18.5) {
      return 'Underweight';
    } else if (widget.bmi >= 18.5 && widget.bmi < 25) {
      return 'Normal weight';
    } else if (widget.bmi >= 25 && widget.bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
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
              width: 270,
              height: 270,
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
                      widget.bmi.toString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 30, color: const Color(0XFF235564)),
                    ),
                    Text(
                      bmiResult(),
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

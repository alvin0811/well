import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

class GaugeWidget extends StatelessWidget {
  final double valueWeight;
  final double valueBmi;

  // final double minValueWeight;
  // final double maxValueWeight;
  // final double minValueBmi;
  // final double maxValueBmi;

  const GaugeWidget({
    required this.valueWeight,
    required this.valueBmi,
    // required this.minValueWeight,
    // required this.maxValueWeight,
    // required this.minValueBmi,
    // required this.maxValueBmi,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 120,
          height: 150,
          child: Stack(
            children: [
              RadialGauge(
                axes: [
                  RadialGaugeAxis(
                      width: 0.3,
                      offset: Offset.zero,
                      color: Colors.yellow,
                      minValue: 0,
                      maxValue: 180,
                      minAngle: 0,
                      maxAngle: 180,
                      rotation: -90,
                      pointers: [
                        RadialNeedlePointer(
                            value: poundsToKilograms(valueWeight) ,
                            thicknessStart: 7,
                            thicknessEnd: 0,
                            knobRadiusAbsolute: 4,
                            knobColor: Colors.black),
                      ],
                      segments: [
                        const RadialGaugeSegment(
                          minValue: 0,
                          maxValue: 60,
                          minAngle: 0,
                          maxAngle: 60,
                          color: Color(0xFFFFD6B0),
                        ),
                        const RadialGaugeSegment(
                          minValue: 60,
                          maxValue: 120,
                          minAngle: 60,
                          maxAngle: 120,
                         color: Color(0xFF235564),
                        ),
                        const RadialGaugeSegment(
                          minValue: 120,
                          maxValue: 180,
                          minAngle: 120,
                          maxAngle: 180,
                          color: Color(0xFFF63E16),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 120,
          height: 150,
          child: Stack(
            children: [
              RadialGauge(
                axes: [
                  RadialGaugeAxis(
                      width: 0.3,
                      offset: Offset.zero,
                      color: const Color.fromRGBO(255, 235, 59, 1),
                      minValue: 0,
                      maxValue: 40,
                      minAngle: 0,
                      maxAngle: 180,
                      rotation: -90,
                      pointers: [
                        RadialNeedlePointer(
                            value: valueBmi,
                            thicknessStart: 7,
                            thicknessEnd: 0,
                            knobRadiusAbsolute: 4,
                            knobColor: Colors.black),
                      ],
                      segments: [
                        const RadialGaugeSegment(
                          minValue: 0,
                          maxValue: 18.5,
                          minAngle: 0,
                          maxAngle: 60,
                          color: Color(0xFFFFD6B0),
                        ),
                        const RadialGaugeSegment(
                          minValue: 18.6,
                          maxValue: 24.9,
                          minAngle: 60,
                          maxAngle: 120,
                          color: Color(0xFF235564),
                        ),
                        const RadialGaugeSegment(
                          minValue: 25,
                          maxValue: 29.9,
                          minAngle: 120,
                          maxAngle: 180,
                          color: Color(0xFFF63E16),
                        ),
                         const RadialGaugeSegment(
                          minValue: 30,
                          maxValue: 40,
                          minAngle: 120,
                          maxAngle: 180,
                          color: Color(0xFFF63E16),
                        ),
                      ],),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


double poundsToKilograms(double pounds) {
  return pounds * 0.45359237;
}

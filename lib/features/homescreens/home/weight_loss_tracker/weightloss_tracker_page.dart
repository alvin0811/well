import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../corewidgets/weight_loss_tracker_widgets/bmi_result_widget.dart';
import '../../../../corewidgets/weight_loss_tracker_widgets/gauge_widget.dart';

class WeightLossTrackerPage extends StatefulWidget {
  static const route = '/weight-loss-track-page';
  const WeightLossTrackerPage({Key? key}) : super(key: key);

  @override
  State<WeightLossTrackerPage> createState() => _WeightLossTrackerPageState();
}

class _WeightLossTrackerPageState extends State<WeightLossTrackerPage> {
  @override
  void initState() {
    super.initState();

    //  _cubit.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Weight Loss Tracker",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 6,
                backgroundColor: Color(0xFFFFD6B0),
              ),
              Text("  Low  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
              const CircleAvatar(
                radius: 6,
                backgroundColor: Color(0xFF235564),
              ),
              Text("  Normal  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
              const CircleAvatar(
                radius: 6,
                backgroundColor: Color(0xFFF63E16),
              ),
              Text("  High  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                "Weight",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xFF4AB7C3)),
              )),
              Expanded(
                  child: Text(
                "BMI",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: const Color(0xFF4AB7C3)),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const GaugeWidget(
                    valueBmi: 0,
                    valueWeight: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "51.4 Kg",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_dropdownarrow.svg",
                                    width: 6,
                                    height: 6,
                                  ),
                                  const Text(" 4.4",
                                      style:
                                          TextStyle(height: 1.2, fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "27.6 Kg",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/ic_dropdownarrow.svg",
                                    width: 6,
                                    height: 6,
                                  ),
                                  const Text(" 2.4",
                                      style:
                                          TextStyle(height: 1.2, fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 90),
                child: Row(
                  children: [
                    BMIResultWidget(
                      weeklyGoalWeight: '',
                      idealWeight: '',
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class GaugeWidget extends StatelessWidget {
//   final double value;
//   final double minValue;
//   final double maxValue;

//   const GaugeWidget({
//     super.key,
//     required this.value,
//     required this.minValue,
//     required this.maxValue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         SizedBox(
//           width: 120,
//           height: 150,
//           child: Stack(
//             children: [
//               RadialGauge(
//                 axes: [
//                   RadialGaugeAxis(
//                       width: 0.3,
//                       offset: Offset.zero,
//                       color: Colors.yellow,
//                       minValue: 0,
//                       maxValue: 180,
//                       minAngle: 0,
//                       maxAngle: 180,
//                       rotation: -90,
//                       pointers: [
//                         RadialNeedlePointer(
//                             value: 90,
//                             thicknessStart: 7,
//                             thicknessEnd: 0,
//                             knobRadiusAbsolute: 4,
//                             knobColor: Colors.black),
//                       ],
//                       segments: [
//                         const RadialGaugeSegment(
//                           minValue: 0,
//                           maxValue: 40,
//                           minAngle: 0,
//                           maxAngle: 60,
//                           color: Color(0xFFFFD6B0),
//                         ),
//                         const RadialGaugeSegment(
//                           minValue: 40,
//                           maxValue: 80,
//                           minAngle: 60,
//                           maxAngle: 120,
//                           color: Color(0xFF85DBD0),
//                         ),
//                         const RadialGaugeSegment(
//                           minValue: 80,
//                           maxValue: 120,
//                           minAngle: 120,
//                           maxAngle: 180,
//                           color: Color(0xFFF63E16),
//                         ),
//                       ]),
//                 ],
//               ),
//               /*      const Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Text(
//                   '0',
//                   style: TextStyle(fontSize: 20, color: Colors.black),
//                 ),
//               ),*/
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 120,
//           height: 150,
//           child: Stack(
//             children: [
//               RadialGauge(
//                 axes: [
//                   RadialGaugeAxis(
//                       width: 0.3,
//                       offset: Offset.zero,
//                       color: Colors.yellow,
//                       minValue: 0,
//                       maxValue: 180,
//                       minAngle: 0,
//                       maxAngle: 180,
//                       rotation: -90,
//                       pointers: [
//                         RadialNeedlePointer(
//                             value: 66,
//                             thicknessStart: 7,
//                             thicknessEnd: 0,
//                             knobRadiusAbsolute: 4,
//                             knobColor: Colors.black),
//                       ],
//                       segments: [
//                         const RadialGaugeSegment(
//                           minValue: 0,
//                           maxValue: 40,
//                           minAngle: 0,
//                           maxAngle: 60,
//                           color: Color(0xFFFFD6B0),
//                         ),
//                         const RadialGaugeSegment(
//                           minValue: 40,
//                           maxValue: 80,
//                           minAngle: 60,
//                           maxAngle: 120,
//                           color: Color(0xFF85DBD0),
//                         ),
//                         const RadialGaugeSegment(
//                           minValue: 80,
//                           maxValue: 120,
//                           minAngle: 120,
//                           maxAngle: 180,
//                           color: Color(0xFFF63E16),
//                         ),
//                       ]),
//                 ],
//               ),
//               /* const Positioned(
//                 bottom: 150,
//                 left: 0,
//                 child: Text(
//                   '0',
//                   style: TextStyle(fontSize: 20, color: Colors.black),
//                 ),
//               ),*/
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiIdealAndWeeklyGoalWeightPage extends StatefulWidget {
  const BmiIdealAndWeeklyGoalWeightPage({
    required this.weeklyGoalWeightInKg,
    required this.idealWeightInKg,
    required this.onIdealWeightSelectedItemChanged,
    required this.onWeeklyGoalWeightSelectedItemChanged,
    super.key,
  });
  final int weeklyGoalWeightInKg;
  final int idealWeightInKg;
  final void Function(int)? onIdealWeightSelectedItemChanged;
  final void Function(int)? onWeeklyGoalWeightSelectedItemChanged;

  @override
  State<BmiIdealAndWeeklyGoalWeightPage> createState() =>
      _BmiIdealAndWeeklyGoalWeightPageState();
}

class _BmiIdealAndWeeklyGoalWeightPageState
    extends State<BmiIdealAndWeeklyGoalWeightPage> {
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          // * Ideal Weight
          Expanded(
            child: GestureDetector(
              onTap: () {
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
                                onSelectedItemChanged:
                                    widget.onIdealWeightSelectedItemChanged,
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
              },
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
                          text: widget.idealWeightInKg == 0
                              ? '__ '
                              : '${widget.idealWeightInKg} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFFA9A9A9),
                                  fontSize: 24)),
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
          // * Spacer
          const SizedBox(width: 25),

          // * Weekly Goal Weight
          Expanded(
            child: GestureDetector(
              onTap: () {
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
                                onSelectedItemChanged: widget
                                    .onWeeklyGoalWeightSelectedItemChanged,
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
              },
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
                          text: widget.weeklyGoalWeightInKg == 0
                              ? '__ '
                              : '${widget.weeklyGoalWeightInKg} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: const Color(0XFFA9A9A9),
                                  fontSize: 24)),
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
        ],
      ),
    );
  }
}

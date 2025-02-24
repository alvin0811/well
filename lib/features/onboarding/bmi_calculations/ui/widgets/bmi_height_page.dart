import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum HeightUnit { ft, cm }

class BmiHeightPage extends StatefulWidget {
  const BmiHeightPage({
    required this.inches,
    required this.ft,
    required this.cm,
    required this.onHeightFtSelectedItemChanged,
    required this.onHeightInchesSelectedItemChanged,
    super.key,
  });
  final int ft;
  final int inches;
  final double cm;
  final void Function(int)? onHeightFtSelectedItemChanged;
  final void Function(int)? onHeightInchesSelectedItemChanged;

  @override
  State<BmiHeightPage> createState() => _BmiHeightPageState();
}

class _BmiHeightPageState extends State<BmiHeightPage> {
  HeightUnit selectedUnit = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  // int ft = 0;
  // int inches = 0;
  // String cm = '';

  // cmToInches(inchess) {
  //   ft = inchess ~/ 12;
  //   inches = inchess % 12;
  //   debugPrint('$ft feet and $inches inches');
  // }

  // inchesToCm() {
  //   int inchesTotal = (ft * 12) + inches;
  //   cm = (inchesTotal * 2.54).toStringAsPrecision(5);
  //   heightController.text = cm;
  // }

  // void checkHeightUnit() {
  //   if (selectedUnit == HeightUnit.ft) {
  //     setState(() {
  //       int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
  //       cmToInches(inchess);
  //       heightController.text = '$ft ft $inches In';
  //     });
  //   } else if (selectedUnit == HeightUnit.cm) {
  //     setState(() {
  //       debugPrint(heightController.text);
  //       inchesToCm();
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ft = widget.ft;
    // inches = widget.inches;
    // cm = widget.cm;
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
                                      onSelectedItemChanged:
                                          widget.onHeightFtSelectedItemChanged,
                                      // onSelectedItemChanged: (int index) {
                                      // setState(() {
                                      //   inchesToCm();
                                      //   ft = (index + 1);
                                      //   heightController.text =
                                      //       "$ft ft $inches In";
                                      // });
                                      // },
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
                                              .titleLarge),
                                    ),
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                      itemExtent: 32.0,
                                      onSelectedItemChanged: widget
                                          .onHeightInchesSelectedItemChanged,
                                      // onSelectedItemChanged: (int index) {
                                      //   print(index);
                                      //   setState(() {
                                      //     inchesToCm();
                                      //     inches = (index);
                                      //     heightController.text =
                                      //         "$ft ft $inches In";
                                      //   });
                                      // },
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
                            text: widget.ft == 0 ? '__ ' : '${widget.ft} ',
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
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.inches == 0
                                  ? '__ '
                                  : '${widget.inches} ',
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
                              fontFeatures: [const FontFeature.subscripts()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    text: widget.cm == 0 ? '__ ' : '${widget.cm} ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0XFFD0D0D0),
                          fontSize: 24,
                        ),
                  ),
                  TextSpan(
                      text: 'cm',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: const Color(0XFFD0D0D0),
                              fontSize: 16,
                              fontFeatures: [const FontFeature.subscripts()])),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_weight_page.dart';

class BmiIdealWeightPage extends StatefulWidget {
  BmiIdealWeightPage({
    super.key,
    required this.kg,
    required this.ft,
    required this.lb,
    required this.onWeightKgSelectedItemChanged,
  });
  int ft = 0;
  int kg = 0;
  String lb = '';

  void Function(int)? onWeightKgSelectedItemChanged;

  @override
  State<BmiIdealWeightPage> createState() => _BmiIdealWeightPageState();
}

class _BmiIdealWeightPageState extends State<BmiIdealWeightPage> {
  WeightUnit selectedUnit = WeightUnit.kg;
  TextEditingController weightController = TextEditingController();
  // int ft = 0;
  // int kg = 0;
  // String lb = '';

  // kgToLb() {
  //   double pounds = kg / 0.45359237;
  //   lb = pounds.toStringAsPrecision(3);
  //   Logger.i('$kg kg and $lb lb');
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ft = widget.ft;
    // kg = widget.kg;
    // lb = widget.lb;
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

                                      onSelectedItemChanged:
                                          widget.onWeightKgSelectedItemChanged,
                                      // onSelectedItemChanged: (int index) {
                                      //   setState(() {
                                      //     // inchesToCm();
                                      //     kg = (index + 1);
                                      //     kgToLb();
                                      //     // weightController.text = "$kg";
                                      //   });
                                      // },
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
                          text: widget.kg == 0 ? '__ ' : '${widget.kg} ',
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
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '${widget.lb} ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0XFFD0D0D0), fontSize: 24)),
                    TextSpan(
                        text: 'lb',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: const Color(0XFFD0D0D0),
                                fontSize: 16,
                                fontFeatures: [
                              const FontFeature.subscripts()
                            ])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

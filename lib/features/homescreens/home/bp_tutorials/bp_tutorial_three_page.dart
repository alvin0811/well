import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../corewidgets/wellpathbutton.dart';

class BPTutorialThreePage extends StatefulWidget {
  final PageController? pageController;
  final changeTabs;
  const BPTutorialThreePage(
      {Key? key, required this.pageController, required this.changeTabs})
      : super(key: key);

  @override
  State<BPTutorialThreePage> createState() => _BPTutorialThreePageState();
}

class _BPTutorialThreePageState extends State<BPTutorialThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "How To Take BP Tutorial",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Good to Know',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: const Color(0XFF4AB7C3), fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        SvgPicture.asset("assets/images/ic_bptutorial_three.svg"),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Avoid Exercising, Smoking or \n Caffeine 30 minutes prior',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: const Color(0XFF4AB7C3),
              fontSize: 16,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Do not take blood pressure reading over \n your clothes',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: WellPathButton(
              onPressed: () {
                setState(
                  () {
                    widget.changeTabs(0);
                  },
                );
              },
              buttonText: "View BP Records"),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../corewidgets/wellpathbutton.dart';

class BPTutorialOnePage extends StatefulWidget {
  final PageController? pageController;
  const BPTutorialOnePage({Key? key, this.pageController}) : super(key: key);

  @override
  State<BPTutorialOnePage> createState() => _BPTutorialOnePageState();
}

class _BPTutorialOnePageState extends State<BPTutorialOnePage> {
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
          'Step 1 of 3',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: const Color(0XFF4AB7C3), fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        SvgPicture.asset("assets/images/ic_bptutorial_one.svg"),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Sit up straight on a chair',
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
          'Arm resting relaxed at the level \n of the heart\n',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: WellPathButton(
                onPressed: () {
                  widget.pageController?.animateToPage(1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                buttonText: "Next"),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

/*
void nextPage(){

}
*/

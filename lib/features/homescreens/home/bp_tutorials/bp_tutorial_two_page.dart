import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../corewidgets/wellpathbutton.dart';

class BPTutorialTwoPage extends StatefulWidget {
  final PageController? pageController;
  const BPTutorialTwoPage({Key? key, this.pageController}) : super(key: key);

  @override
  State<BPTutorialTwoPage> createState() => _BPTutorialTwoPageState();
}

class _BPTutorialTwoPageState extends State<BPTutorialTwoPage> {
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
          'Step 2 of 3',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: const Color(0XFF4AB7C3), fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        SvgPicture.asset("assets/images/ic_bptutorial_two.svg"),
        const SizedBox(
          height: 10,
        ),
        Text(
          'The Cuff should be strapped between the elbow & shoulder',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: const Color(0XFF4AB7C3),
              fontSize: 16,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Sit Quietly without speaking for five minutes \n prior to measuring',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: WellPathButton(
                onPressed: () {
                  widget.pageController?.animateToPage(2,
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

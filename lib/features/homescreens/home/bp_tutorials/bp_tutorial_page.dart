import 'package:flutter/material.dart';

import 'bp_tutorial_one_page.dart';
import 'bp_tutorial_three_page.dart';
import 'bp_tutorial_two_page.dart';

class BPTutorialPage extends StatefulWidget {
  int state;
  final changeTabs;
  BPTutorialPage(this.state, {Key? key, required this.changeTabs})
      : super(key: key);

  @override
  State<BPTutorialPage> createState() => _BPTutorialPageState();
}

class _BPTutorialPageState extends State<BPTutorialPage> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        BPTutorialOnePage(pageController: controller),
        BPTutorialTwoPage(pageController: controller),
        BPTutorialThreePage(
            pageController: controller, changeTabs: widget.changeTabs),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

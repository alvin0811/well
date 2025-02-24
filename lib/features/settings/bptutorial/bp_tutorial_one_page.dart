import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';

class BpTutorialOneSettingPage extends StatefulWidget {
  const BpTutorialOneSettingPage({super.key});

  @override
  State<BpTutorialOneSettingPage> createState() =>
      _BpTutorialOneSettingPageState();
}

class _BpTutorialOneSettingPageState extends State<BpTutorialOneSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_onboard.png",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "How To Take BP Tutorial",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Step 1 of 3',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFF4AB7C3), fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  SvgPicture.asset(
                    "assets/images/ic_bptutorial_one.svg",
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Sit Up Straight On A Chair',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFF4AB7C3),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Arm resting relaxed at the level \n of the heart\n',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: WellPathButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/bptutorialtwo");
                        },
                        buttonText: "Next"),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

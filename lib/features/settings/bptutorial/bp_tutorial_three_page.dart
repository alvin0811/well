import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/corewidgets/wellpathbutton.dart';

class BpTutorialThreeSettingPage extends StatefulWidget {
  const BpTutorialThreeSettingPage({super.key});

  @override
  State<BpTutorialThreeSettingPage> createState() =>
      _BpTutorialThreeSettingPageState();
}

class _BpTutorialThreeSettingPageState
    extends State<BpTutorialThreeSettingPage> {
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
                    'Good to know',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: const Color(0XFF4AB7C3), fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  SvgPicture.asset(
                    "assets/images/ic_bptutorial_three.svg",
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'Avoid Exercising, Smoking Or \n Caffeine 30 Minutes Prior',
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
                    "Do not take blood pressure reading over \n your clothes",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: WellPathButton(
                        onPressed: () {
                          Navigator.of(context)
                            ..pop()
                            ..pop()
                            ..pop();
                        },
                        buttonText: "Done"),
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
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Text(
    //             "How To Take BP Tutorial",
    //             style: Theme.of(context).textTheme.headlineMedium,
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //         'Good to Know',
    //         style: Theme.of(context)
    //             .textTheme
    //             .headlineSmall
    //             ?.copyWith(color: const Color(0XFF4AB7C3), fontSize: 14),
    //         textAlign: TextAlign.start,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       SvgPicture.asset("assets/images/ic_bptutorial_three.svg"),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //         'Avoid Exercising, Smoking or \n Caffeine 30 minutes prior',
    //         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //             color: const Color(0XFF4AB7C3),
    //             fontSize: 16,
    //             fontWeight: FontWeight.w600),
    //         textAlign: TextAlign.start,
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //         'Do not take blood pressure reading over \n your clothes',
    //         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //             color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    //         textAlign: TextAlign.center,
    //       ),
    //       const SizedBox(
    //         height: 17,
    //       ),
    //       Expanded(
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: WellPathButton(
    //               onPressed: () {
    //                 setState(
    //                   () {},
    //                 );
    //               },
    //               buttonText: "View BP Records"),
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       )
    //     ],
    //   ),
    // );
  }
}

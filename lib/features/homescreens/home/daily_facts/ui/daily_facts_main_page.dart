import 'package:flutter/material.dart';

import 'package:well_path/features/homescreens/home/daily_facts/ui/daily_facts_listing_details_page.dart';
import 'package:well_path/features/homescreens/home/daily_facts/ui/daily_facts_listing_page.dart';
import 'package:well_path/features/settings/health_facts/models/daily_facts_model.dart';
import 'package:well_path/features/settings/health_facts/models/data_initialization.dart';

class DailyFactsPage extends StatefulWidget {
  const DailyFactsPage({super.key});

  @override
  State<DailyFactsPage> createState() => _DailyFactsPageState();
}

class _DailyFactsPageState extends State<DailyFactsPage> {
  final PageController controller = PageController(initialPage: 0);
  DailyFacts? dailyFact;

  void changeIndexfordailyFact(int index) {
    setState(() {
      dailyFact = listDailyFacts[index];
    });

    controller.animateToPage(1,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        DailyFactListingPage(
          pageController: controller,
          dailyFact: dailyFact,
          onSonChanged: (index) {
            changeIndexfordailyFact(index);
          },
        ),
        DailyFactListingDetailPage(
          pageController: controller,
          dailyFact: dailyFact,
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

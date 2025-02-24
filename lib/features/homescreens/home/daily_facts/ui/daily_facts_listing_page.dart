import 'package:flutter/material.dart';
import 'package:well_path/features/settings/health_facts/models/daily_facts_model.dart';
import 'package:well_path/features/settings/health_facts/models/data_initialization.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_item.dart';

typedef IntCallback = void Function(int id);

class DailyFactListingPage extends StatefulWidget {
  final PageController? pageController;
  final DailyFacts? dailyFact;

  final IntCallback onSonChanged;
  const DailyFactListingPage(
      {super.key,
      this.pageController,
      this.dailyFact,
      required this.onSonChanged});

  @override
  State<DailyFactListingPage> createState() => _DailyFactListingPageState();
}

class _DailyFactListingPageState extends State<DailyFactListingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: listDailyFacts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: DailyFactsItems(
            dailyFactImages: listDailyFacts[index].dailyFactImage,
            dailyFactsHeading: listDailyFacts[index].dailyFactName,
            onTap: () {
              widget.onSonChanged(index);
            },
          ),
        );
      },
    );
  }
}

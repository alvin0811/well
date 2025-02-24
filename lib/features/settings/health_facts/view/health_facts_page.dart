import 'package:flutter/material.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/extensions/extensions.dart';
import 'package:well_path/features/settings/health_facts/models/data_initialization.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_details_page.dart';
import 'package:well_path/features/settings/health_facts/view/health_facts_item.dart';

class HealthFactsPage extends StatefulWidget {
  static const route = '/health-facts';

  const HealthFactsPage({
    super.key,
  });

  @override
  State<HealthFactsPage> createState() => _HealthFactsPageState();
}

class _HealthFactsPageState extends State<HealthFactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Health Facts',
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listDailyFacts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: DailyFactsItems(
                        dailyFactImages: listDailyFacts[index].dailyFactImage,
                        dailyFactsHeading: listDailyFacts[index].dailyFactName,
                        onTap: () {
                          context.navigator.pushNamed(
                            HealthFactsDetailsPage.route,
                            arguments: listDailyFacts[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

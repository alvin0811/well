import 'package:flutter/material.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/features/settings/health_facts/models/daily_facts_model.dart'; // ignore: unused_import
import 'package:well_path/features/settings/health_facts/view/bullet_Items.dart';

class HealthFactsDetailsPage extends StatefulWidget {
  static const route = '/health-facts-detail';

  const HealthFactsDetailsPage({
    super.key,
  });

  @override
  State<HealthFactsDetailsPage> createState() => _HealthFactsDetailsPageState();
}

class _HealthFactsDetailsPageState extends State<HealthFactsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DailyFacts dailyFact =
        (ModalRoute.of(context)?.settings.arguments) as DailyFacts;

    return Scaffold(
      appBar: WellPathAppBar(
        leading: AppBarBackButton(
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              dailyFact.dailyFactName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox.square(dimension: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dailyFact.questionaire.questionaire.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                              iconTheme: const IconThemeData(
                                  color: Color(0xFF4AB7C3))),
                          child: ExpansionTile(
                            collapsedIconColor: const Color(0xFF4AB7C3),
                            iconColor: const Color(0xFF4AB7C3),
                            collapsedBackgroundColor: Colors.white,
                            title: Text(
                              dailyFact.questionaire.questionaire.keys.elementAt(
                                  index), //here key of map which is question will be printed...
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: const Color(0xFF4AB7C3)),
                            ),
                            children: <Widget>[
                              for (var i = 0;
                                  i <
                                      dailyFact.questionaire.questionaire.values
                                          .elementAt(index)
                                          .length;
                                  i++)
                                BulletItems(
                                  color: Colors.black,
                                  bulletPoint: dailyFact
                                          .questionaire.questionaire[
                                      dailyFact.questionaire.questionaire.keys
                                          .elementAt(index)]![i],
                                )
                              //Text('Item $i'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// extension GetByKeyIndex on Map {
//   elementAt(int index) => values.elementAt(index);
// }

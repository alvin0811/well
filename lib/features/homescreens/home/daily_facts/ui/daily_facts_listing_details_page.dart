import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';
import 'package:well_path/features/settings/health_facts/models/daily_facts_model.dart';
import 'package:well_path/features/settings/health_facts/view/bullet_Items.dart';

class DailyFactListingDetailPage extends StatefulWidget {
  final PageController? pageController;
  final DailyFacts? dailyFact;
  const DailyFactListingDetailPage(
      {super.key, this.pageController, this.dailyFact});

  @override
  State<DailyFactListingDetailPage> createState() =>
      _DailyFactListingDetailPageState();
}

class _DailyFactListingDetailPageState
    extends State<DailyFactListingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.pageController?.animateToPage(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                },
                child: SizedBox(
                  width: 27,
                  height: 27,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xFF4AB7C3), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child:
                          SvgPicture.asset("assets/images/ic_back_arrow.svg"),
                    ),
                  ),
                ),
              ),
              Text(
                '  Back',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Text(
            widget.dailyFact!.dailyFactName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.dailyFact!.questionaire.questionaire.length,
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
                          iconTheme:
                              const IconThemeData(color: Color(0xFF4AB7C3))),
                      child: ExpansionTile(
                        collapsedIconColor: const Color(0xFF4AB7C3),
                        iconColor: const Color(0xFF4AB7C3),
                        collapsedBackgroundColor: Colors.white,
                        title: Text(
                          widget.dailyFact!.questionaire.questionaire.keys
                                  .elementAt(index) ??
                              "", //here key of map which is question will be printed...
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
                                  widget.dailyFact!.questionaire.questionaire
                                      .values
                                      .elementAt(index)
                                      .length;
                              i++)
                            BulletItems(
                              color: Colors.black,
                                bulletPoint: widget
                                        .dailyFact!.questionaire.questionaire[
                                    widget.dailyFact!.questionaire.questionaire
                                        .keys
                                        .elementAt(index)]![i])
                          //Text('Item $i'),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

extension GetByKeyIndex on Map {
  elementAt(int index) => values.elementAt(index);
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

// void _launchURL(Uri url) async {
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

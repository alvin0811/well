class DailyFacts {
  String dailyFactImage;
  String dailyFactName;
  DailyFactsQuestionaire questionaire;
  DailyFacts(
      {required this.dailyFactName,
      required this.questionaire,
      required this.dailyFactImage});
}

class DailyFactsQuestionaire {
  Map<String, List<String>> questionaire;
  DailyFactsQuestionaire({required this.questionaire});
}

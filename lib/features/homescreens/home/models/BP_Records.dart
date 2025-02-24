class BRRecords {
  bool isVisible;
  final String date;
  final String time;
  final String type;
  final List<SubCategoryBP> subCategoryBP;

  BRRecords(
      this.date, this.time, this.type, this.subCategoryBP, this.isVisible);
}

class SubCategoryBP {
  final String subType;
  final int mmHg;

  const SubCategoryBP(this.subType, this.mmHg);
}

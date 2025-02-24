class AlertBPContent {
  final String type;
  final int categoryBp;
  final String heading;
  final String description;
  final String diAstolic;
  final String systolic;

  const AlertBPContent(
      {required this.type,
      required this.categoryBp,
      required this.heading,
      required this.description,
      required this.systolic,
      required this.diAstolic});
}

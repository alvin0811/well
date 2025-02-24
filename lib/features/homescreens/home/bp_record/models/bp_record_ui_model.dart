class BpListUiModel {
  BpListUiModel(
      {required this.id,
      required this.date,
      required this.time,
      required this.systolicBp,
      required this.diAstolicBp,
      required this.pulse,
      required this.isVisible});

  final int id;
  final String date;
  final String time;
  final int systolicBp;
  final int diAstolicBp;
  final int pulse;
  final int isVisible;
}

class SubwayModel {
  final String updnLine;
  final String trainLineNm;
  final String statnNm;
  final String arvlMsg2;
  final String arvlMsg3;

  SubwayModel({
    required this.updnLine,
    required this.trainLineNm,
    required this.statnNm,
    required this.arvlMsg2,
    required this.arvlMsg3,
  });

  factory SubwayModel.fromJson(Map<String, dynamic> json) {
    return SubwayModel(
      updnLine: json['updnLine'] as String,
      trainLineNm: json['trainLineNm'] as String,
      statnNm: json['statnNm'] as String,
      arvlMsg2: json['arvlMsg2'] as String,
      arvlMsg3: json['arvlMsg3'] as String
    );
  }
}

class RankingDto {
  String name;
  String userid;
  int total;
  String temporada;
  int level;
  int createdHour;
  int quantity;
  int minute;
  String uid;
  @Deprecated("Vai ser trocado por updateAt")
  int timeup;
  int createdAt;
  int updatedAt;

  RankingDto({
    required this.name,
    required this.userid,
    required this.total,
    required this.temporada,
    required this.level,
    required this.createdHour,
    required this.quantity,
    required this.minute,
    required this.uid,
    required this.timeup,
    required this.createdAt,
    required this.updatedAt,
  });
}

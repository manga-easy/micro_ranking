// ignore_for_file: public_member_api_docs, sort_constructors_first
class RankingEntity {
  String name;
  int total;
  String temp;
  int level;
  int createdHour;
  int quantity;
  int minute;
  String userid;
  String uid;
  @Deprecated("Vai ser trocado por updateAt")
  int timeup;
  int createdAt;
  int updatedAt;

  RankingEntity({
    required this.name,
    required this.total,
    required this.temp,
    required this.level,
    required this.createdHour,
    required this.quantity,
    required this.minute,
    required this.userid,
    required this.uid,
    required this.timeup,
    required this.createdAt,
    required this.updatedAt,
  });
}

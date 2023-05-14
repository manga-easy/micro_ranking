class SeasonDto {
  String id;
  String nome;
  int number;
  int datacria;
  int? createdAt;
  int? updatedAt;

  SeasonDto({
    required this.id,
    required this.nome,
    required this.number,
    required this.datacria,
    this.createdAt,
    this.updatedAt,
  });
}

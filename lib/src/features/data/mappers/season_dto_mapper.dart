import 'package:ranking/src/features/data/dtos/season_dto.dart';
import 'package:ranking/src/features/domain/entities/season_entity.dart';

class SeasonDtoMapper {
  SeasonDto fromJson(Map<String, dynamic> json) {
    return SeasonDto(
      id: json['uid'],
      nome: json['nome'],
      number: json['number'],
      datacria: json['datacria'] ?? 0,
      createdAt: json['createdat'],
      updatedAt: json['updatedat'],
    );
  }

  SeasonEntity toEntity(SeasonDto seasonDto) {
    return SeasonEntity(
      id: seasonDto.id,
      nome: seasonDto.nome,
      number: seasonDto.number,
      createdAt: seasonDto.createdAt ?? seasonDto.datacria,
      updatedAt: seasonDto.updatedAt ?? seasonDto.datacria,
    );
  }

  Map<String, dynamic> toJson(SeasonDto seasonDto) {
    return {
      'uid': seasonDto.id,
      'nome': seasonDto.nome,
      'number': seasonDto.number,
      'createdat': seasonDto.createdAt,
      'updatedat': seasonDto.updatedAt,
    };
  }
}

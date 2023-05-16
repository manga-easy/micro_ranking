import 'package:manga_easy_ranking/src/features/data/dtos/ranking_dto.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';

class RankingDtoMapper {
  RankingDto fromJson(Map<String, dynamic> json) {
    return RankingDto(
      uid: json['uid'],
      name: json['name'],
      total: json['total'],
      temporada: json['temporada'],
      level: json['lvl'],
      createdHour: json['timecria'],
      minute: json['minute'],
      userid: json['userid'],
      quantity: json['quantity'],
      timeup: json['timeup'],
      createdAt: json['createdat'],
      updatedAt: json['updatedat'],
    );
  }

  RankingEntity toEntity(RankingDto seasonDto) {
    return RankingEntity(
      createdAt: seasonDto.createdAt,
      createdHour: seasonDto.createdHour,
      level: seasonDto.level,
      minute: seasonDto.minute,
      username: seasonDto.name,
      temp: seasonDto.temporada,
      uid: seasonDto.uid,
      quantity: seasonDto.quantity,
      timeup: seasonDto.timeup,
      total: seasonDto.total,
      updatedAt: seasonDto.updatedAt,
      userid: seasonDto.uid,
    );
  }

  Map<String, dynamic> toJson(RankingDto seasonDto) {
    return {
      "uid": seasonDto.uid,
      "name": seasonDto.name,
      "total": seasonDto.total,
      "temporada": seasonDto.temporada,
      "lvl": seasonDto.level,
      "timecria": seasonDto.createdHour,
      "quantity": seasonDto.quantity,
      "minute": seasonDto.minute,
      "userid": seasonDto.uid,
      "timeup": seasonDto.timeup,
      "createdat": seasonDto.createdAt,
      "updatedat": seasonDto.updatedAt,
    };
  }
}

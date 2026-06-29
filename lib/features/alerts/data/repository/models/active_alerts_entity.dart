import 'package:air_alerts_map/features/alerts/data/data_source/models/active_alerts_dto.dart';

class ActiveAlertsEntity {
  final int id;
  final String locationOblast;
  final String startedAt;

  ActiveAlertsEntity.fromDto(AlertDto dto)
    : id = dto.id,
      locationOblast = dto.locationOblast,
      startedAt = dto.startedAt;

  ActiveAlertsEntity({
    required this.id,
    required this.locationOblast,
    required this.startedAt,
  });
}

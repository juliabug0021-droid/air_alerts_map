import 'package:air_alerts_map/features/alerts/data/data_source/models/active_alerts_dto.dart';

class ActiveAlertsEntity {
  final int id;
  final String locationTitle;
  final String alertType;

  ActiveAlertsEntity.fromDto(AlertDto dto)
    : id = dto.id,
      locationTitle = dto.locationTitle,
      alertType = dto.alertType;

  ActiveAlertsEntity({
    required this.id,
    required this.locationTitle,
    required this.alertType,
  });
}

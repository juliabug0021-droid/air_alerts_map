// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_alerts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveAlertsDto _$ActiveAlertsDtoFromJson(Map<String, dynamic> json) =>
    ActiveAlertsDto(
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => AlertDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveAlertsDtoToJson(ActiveAlertsDto instance) =>
    <String, dynamic>{
      'alerts': instance.alerts.map((e) => e.toJson()).toList(),
    };

AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => AlertDto(
  id: (json['id'] as num).toInt(),
  locationTitle: json['location_title'] as String,
  locationType: json['location_type'] as String,
  startedAt: json['started_at'] as String,
  finishedAt: json['finished_at'] as String?,
  updatedAt: json['updated_at'] as String,
  alertType: json['alert_type'] as String,
  locationOblast: json['location_oblast'] as String,
  locationUid: json['location_uid'] as String,
  notes: json['notes'] as String?,
  country: json['country'] as String?,
  deletedAt: json['deleted_at'] as String?,
  calculated: json['calculated'],
  locationRaion: json['location_raion'] as String?,
  locationOblastUid: (json['location_oblast_uid'] as num).toInt(),
);

Map<String, dynamic> _$AlertDtoToJson(AlertDto instance) => <String, dynamic>{
  'id': instance.id,
  'location_title': instance.locationTitle,
  'location_type': instance.locationType,
  'started_at': instance.startedAt,
  'finished_at': instance.finishedAt,
  'updated_at': instance.updatedAt,
  'alert_type': instance.alertType,
  'location_oblast': instance.locationOblast,
  'location_uid': instance.locationUid,
  'notes': instance.notes,
  'country': instance.country,
  'deleted_at': instance.deletedAt,
  'calculated': instance.calculated,
  'location_raion': instance.locationRaion,
  'location_oblast_uid': instance.locationOblastUid,
};

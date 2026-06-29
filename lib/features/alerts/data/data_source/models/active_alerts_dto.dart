import 'package:json_annotation/json_annotation.dart';

part 'active_alerts_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ActiveAlertsDto {
  final List<AlertDto> alerts;

  ActiveAlertsDto({required this.alerts});

  factory ActiveAlertsDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveAlertsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveAlertsDtoToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AlertDto {
  final int id;
  final String locationTitle;
  final String locationType;
  final String startedAt;
  final String? finishedAt;
  final String updatedAt;
  final String alertType;
  final String locationOblast;
  final String locationUid;
  final String? notes;
  final String? country;
  final String? deletedAt;
  final dynamic calculated;
  final String? locationRaion;
  final int locationOblastUid;

  AlertDto({
    required this.id,
    required this.locationTitle,
    required this.locationType,
    required this.startedAt,
    this.finishedAt,
    required this.updatedAt,
    required this.alertType,
    required this.locationOblast,
    required this.locationUid,
    this.notes,
    this.country,
    this.deletedAt,
    this.calculated,
    required this.locationRaion,
    required this.locationOblastUid,
  });

  factory AlertDto.fromJson(Map<String, dynamic> json) =>
      _$AlertDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AlertDtoToJson(this);
}

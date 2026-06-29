import 'package:air_alerts_map/features/alerts/data/repository/models/active_alerts_entity.dart';
import 'package:equatable/equatable.dart';

enum AlertsStatus { loading, loaded, error }

class AlertsState extends Equatable {
  final List<ActiveAlertsEntity> alerts;
  final AlertsStatus status;

  factory AlertsState.initial() =>
      const AlertsState(alerts: [], status: AlertsStatus.loading);

  const AlertsState({required this.alerts, required this.status});

  AlertsState copyWith({
    List<ActiveAlertsEntity>? alerts,
    AlertsStatus? status,
  }) {
    return AlertsState(
      alerts: alerts ?? this.alerts,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [alerts, status];
}

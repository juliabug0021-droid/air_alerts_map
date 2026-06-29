import 'package:air_alerts_map/features/alerts/data/data_source/alerts_datasource.dart';
import 'package:air_alerts_map/features/alerts/data/repository/models/active_alerts_entity.dart';

class AlertsRepository {
  final AlertsDataSource dataSource;

  AlertsRepository({required this.dataSource});

  Future<List<ActiveAlertsEntity>> getActiveAlerts() async {
    final dataAlerts = await dataSource.getActiveAlerts();
    return dataAlerts.alerts.map(ActiveAlertsEntity.fromDto).toList();
  }
}

import 'package:air_alerts_map/features/alerts/data/data_source/alerts_datasource.dart';
import 'package:air_alerts_map/features/alerts/data/repository/alerts_repository.dart';
import 'package:air_alerts_map/features/alerts/data/repository/models/active_alerts_entity.dart';
import 'package:flutter/material.dart';

class AlertsMapScreen extends StatefulWidget {
  const AlertsMapScreen({super.key});

  @override
  State<AlertsMapScreen> createState() => _AlertsMapScreenState();
}

class _AlertsMapScreenState extends State<AlertsMapScreen> {
  final repository = AlertsRepository(dataSource: AlertsDataSourceImpl());
  List<ActiveAlertsEntity> alerts = [];
  @override
  void initState() {
    super.initState();

    _loadAlerts();
  }

  Future<void> _loadAlerts() async {
    alerts = await repository.getActiveAlerts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts Map')),
      body: alerts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];

                return ListTile(
                  title: Text(alert.locationOblast),
                  subtitle: Text(alert.startedAt),
                );
              },
            ),
    );
  }
}

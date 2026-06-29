import 'package:air_alerts_map/features/alerts/data/data_source/alerts_datasource.dart';
import 'package:flutter/material.dart';

class AlertsMapScreen extends StatefulWidget {
  const AlertsMapScreen({super.key});

  @override
  State<AlertsMapScreen> createState() => _AlertsMapScreenState();
}

class _AlertsMapScreenState extends State<AlertsMapScreen> {
  final AlertsDataSource _dataSource = AlertsDataSourceImpl();

  @override
  void initState() {
    super.initState();

    _loadAlerts();
  }

  Future<void> _loadAlerts() async {
    final alerts = await _dataSource.getActiveAlerts();

    debugPrint(alerts.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts Map')),
      body: const Center(child: Text('Map')),
    );
  }
}

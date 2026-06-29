import 'package:air_alerts_map/features/alerts/data/repository/models/active_alerts_entity.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_cubit.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertsMapScreen extends StatefulWidget {
  const AlertsMapScreen({super.key});

  @override
  State<AlertsMapScreen> createState() => _AlertsMapScreenState();
}

class _AlertsMapScreenState extends State<AlertsMapScreen> {
  late final AlertsCubit _cubit;
  @override
  void initState() {
    super.initState();

    _cubit = context.read<AlertsCubit>();
    _cubit.getActiveAlerts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts Map')),
      body: BlocBuilder<AlertsCubit, AlertsState>(
        builder: (context, state) {
          return switch (state.status) {
            AlertsStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
            AlertsStatus.loaded => MapWidget(alerts: state.alerts),
            AlertsStatus.error => const Center(
              child: Text('Error loading alerts'),
            ),
          };
        },
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.alerts});

  final List<ActiveAlertsEntity> alerts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final alert = alerts[index];

        return ListTile(
          title: Text(alert.locationOblast),
          subtitle: Text(alert.startedAt),
        );
      },
    );
  }
}

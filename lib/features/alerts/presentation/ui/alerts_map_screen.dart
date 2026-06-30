import 'package:air_alerts_map/features/alerts/data/repository/models/active_alerts_entity.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_cubit.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_state.dart';
import 'package:air_alerts_map/features/alerts/presentation/utils/oblast_image_mapper.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7EC8F2), Color(0xFFAADBF7)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.4),
          surfaceTintColor: Colors.transparent,
          title: const Text(
            'Alerts Map',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
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
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.alerts});

  final List<ActiveAlertsEntity> alerts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset('assets/images/mapUkraine/Map.png', fit: BoxFit.cover),
            ...alerts.map((alert) {
              final overlayPath = OblastImageMapper.getOverlay(
                alert.locationOblast,
              );
              if (overlayPath.isNotEmpty) {
                return Image.asset(overlayPath, fit: BoxFit.cover);
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final alert = alerts[index];

              return Card(
                elevation: 2,
                color: const Color.fromARGB(255, 180, 224, 255),
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/danger.png', width: 24),

                  title: Text(
                    alert.locationOblast,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                    alert.startedAt,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

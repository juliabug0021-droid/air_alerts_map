import 'package:air_alerts_map/features/alerts/data/repository/alerts_repository.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final AlertsRepository repository;

  AlertsCubit({required this.repository}) : super(AlertsState.initial());

  Future<void> getActiveAlerts() async {
    try {
      emit(state.copyWith(status: AlertsStatus.loading));
      final alerts = await repository.getActiveAlerts();
      emit(state.copyWith(alerts: alerts, status: AlertsStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: AlertsStatus.error));
    }
  }
}

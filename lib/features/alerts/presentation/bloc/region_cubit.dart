import 'package:air_alerts_map/features/alerts/data/repository/region_repository.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionCubit extends Cubit<RegionState> {
  final RegionRepository repository;

  RegionCubit({required this.repository}) : super(RegionState.initial());

  Future<void> getRegionAlerts(int uid) async {
    try {
      emit(state.copyWith(status: RegionStatus.loading));
      final airRaid = await repository.getRegionAlerts(uid);
      emit(state.copyWith(airRaidStatus: airRaid, status: RegionStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: RegionStatus.error));
    }
  }
}

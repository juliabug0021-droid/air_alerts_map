import 'package:air_alerts_map/features/alerts/data/repository/region_repository.dart';
import 'package:equatable/equatable.dart';

enum RegionStatus { loading, loaded, error }

class RegionState extends Equatable {
  final AirRaidStatus? airRaidStatus;
  final RegionStatus status;
  factory RegionState.initial() =>
      RegionState(airRaidStatus: null, status: RegionStatus.loading);

  const RegionState({required this.airRaidStatus, required this.status});

  RegionState copyWith({AirRaidStatus? airRaidStatus, RegionStatus? status}) {
    return RegionState(
      airRaidStatus: airRaidStatus ?? this.airRaidStatus,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [airRaidStatus, status];
}

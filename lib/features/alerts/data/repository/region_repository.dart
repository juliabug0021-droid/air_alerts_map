import 'package:air_alerts_map/features/alerts/data/data_source/region_datasource.dart';

enum AirRaidStatus { active, partial, none }

class RegionRepository {
  RegionRepository({required this.dataSource});
  final RegionDataSource dataSource;

  Future<AirRaidStatus> getRegionAlerts(int uid) async {
    final rawData = await dataSource.getRegionAlerts(uid);

    final cleanStatus = rawData.trim().replaceAll('"', '').toUpperCase();
    switch (cleanStatus) {
      case 'A':
        return AirRaidStatus.active;
      case 'P':
        return AirRaidStatus.partial;
      case 'N':
        return AirRaidStatus.none;
      default:
        throw Exception('Unknown status: $cleanStatus');
    }
  }
}

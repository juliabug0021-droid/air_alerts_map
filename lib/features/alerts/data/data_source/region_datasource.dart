import 'package:dio/dio.dart';

abstract class RegionDataSource {
  Future<String> getRegionAlerts(int uid);
}

class RegionDataSourceImpl implements RegionDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));
  static const String _apiToken = String.fromEnvironment('API_TOKEN');

  @override
  Future<String> getRegionAlerts(int uid) async {
    final response = await _dio.get<String>(
      '/v1/iot/active_air_raid_alerts/$uid.json',
      queryParameters: {'token': _apiToken},
    );
    final data = response.data;

    if (data == null) {
      throw Exception(
        'API error. Please contact api@alerts.in.ua for details.',
      );
    }
    return data;
  }
}

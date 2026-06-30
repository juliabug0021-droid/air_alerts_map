import 'package:air_alerts_map/features/alerts/data/data_source/models/active_alerts_dto.dart';
import 'package:dio/dio.dart';

abstract class AlertsDataSource {
  Future<ActiveAlertsDto> getActiveAlerts();
}

class AlertsDataSourceImpl implements AlertsDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));
  static const String _apiToken = String.fromEnvironment('API_TOKEN');

  @override
  Future<ActiveAlertsDto> getActiveAlerts() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/v1/alerts/active.json',
      queryParameters: {'token': _apiToken},
    );
    final data = response.data;

    if (data == null) {
      throw Exception('Failed to fetch active alerts: ${response.statusCode}');
    }
    return ActiveAlertsDto.fromJson(data);
  }
}

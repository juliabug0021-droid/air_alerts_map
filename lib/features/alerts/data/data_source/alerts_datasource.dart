import 'package:dio/dio.dart';

class AlertsDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));
  static const String _apiToken = String.fromEnvironment('API_TOKEN');
  Future<Map<String, dynamic>> getActiveAlerts() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/v1/alerts/active.json',
      queryParameters: {'token': _apiToken},
    );
    final data = response.data;

    if (data == null) {
      throw Exception('Failed to fetch active alerts: ${response.statusCode}');
    }
    return data;
  }
}

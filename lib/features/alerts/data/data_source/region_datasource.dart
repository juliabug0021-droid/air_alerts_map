import 'package:dio/dio.dart';

abstract class RegionDataSource {
  Future<String> getRegionAlerts(int uid);
}

class RegionDataSourceImpl implements RegionDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.alerts.in.ua'));
  static const String _apiToken = String.fromEnvironment('API_TOKEN');

  @override
  Future<String> getRegionAlerts(int uid) async {
    try {
      final response = await _dio.get<String>(
        '/v1/iot/active_air_raid_alerts/$uid.json',
        queryParameters: {'token': _apiToken},
      );

      final data = response.data;

      if (data == null || data.isEmpty) {
        throw Exception('API returned an empty response body.');
      }

      return data;
    } on DioException catch (e) {
      final serverMessage = e.response?.data?.toString() ?? e.message;

      print('Помилка Dio від сервера (UID: $uid): $serverMessage');

      throw Exception('API error from alerts.in.ua: $serverMessage');
    } catch (e) {
      print('Загальна помилка в DataSource: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}

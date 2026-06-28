import 'package:air_alerts_map/features/presentation/ui/my_home_page.dart';
import 'package:air_alerts_map/features/presentation/ui/region_alerts_screen.dart';
import 'package:air_alerts_map/features/presentation/ui/alerts_map_screen.dart';
import 'package:air_alerts_map/router/page_names.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: ScreenNames.home,
      builder: (context, state) => MyHomePage(),
      routes: [
        GoRoute(
          path: 'alerts-map',
          name: ScreenNames.alertsMap,
          builder: (context, state) => AlertsMapScreen(),
        ),
        GoRoute(
          path: 'region-alerts',
          name: ScreenNames.regionAlerts,
          builder: (context, state) => RegionAlertsScreen(),
        ),
      ],
    ),
  ],
);

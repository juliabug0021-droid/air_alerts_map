import 'package:air_alerts_map/features/alerts/data/data_source/alerts_datasource.dart';
import 'package:air_alerts_map/features/alerts/data/data_source/region_datasource.dart';
import 'package:air_alerts_map/features/alerts/data/repository/alerts_repository.dart';
import 'package:air_alerts_map/features/alerts/data/repository/region_repository.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/alerts_cubit.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_cubit.dart';
import 'package:air_alerts_map/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlertsCubit>(
          create: (context) => AlertsCubit(
            repository: AlertsRepository(dataSource: AlertsDataSourceImpl()),
          ),
        ),
        BlocProvider<RegionCubit>(
          create: (context) => RegionCubit(
            repository: RegionRepository(dataSource: RegionDataSourceImpl()),
          ),
        ),
      ],

      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}

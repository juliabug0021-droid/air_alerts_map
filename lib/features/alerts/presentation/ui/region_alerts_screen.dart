import 'package:air_alerts_map/features/alerts/data/repository/region_repository.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_cubit.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_state.dart';
import 'package:air_alerts_map/features/alerts/presentation/ui/region_dropdown.dart';
import 'package:air_alerts_map/features/alerts/presentation/utils/region_enum.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionAlertsScreen extends StatefulWidget {
  const RegionAlertsScreen({super.key});

  @override
  State<RegionAlertsScreen> createState() => _RegionAlertsScreenState();
}

class _RegionAlertsScreenState extends State<RegionAlertsScreen> {
  Region? _selectedRegion;
  @override
  void dispose() {
    context.read<RegionCubit>().reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionCubit, RegionState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(microseconds: 100),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(gradient: _gradient(state)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white.withValues(alpha: 0.4),
              surfaceTintColor: Colors.transparent,
              title: const Text(
                'Region Alerts',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: BackButton(),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _selectedRegion == null
                        ? null
                        : () {
                            context.read<RegionCubit>().getRegionAlerts(
                              _selectedRegion!.uid,
                            );
                          },
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 48,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                      maxHeight: 300,
                    ),
                    child: ImageWidget(state: state),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: RegionDropdown(
                    onSelected: (region) {
                      if (region != null) {
                        setState(() {
                          _selectedRegion = region;
                        });
                        context.read<RegionCubit>().getRegionAlerts(region.uid);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  LinearGradient _gradient(RegionState state) {
    switch (state.status) {
      case RegionStatus.initial:
      case RegionStatus.error:
        return const LinearGradient(
          colors: [Color(0xFF7EC8F2), Color(0xFFAADBF7)],
        );

      case RegionStatus.loading:
      case RegionStatus.loaded:
        switch (state.airRaidStatus) {
          case AirRaidStatus.active:
          case AirRaidStatus.partial:
            return LinearGradient(
              colors: [Color(0xFFA30000), Color(0xFFFF2E2E)],
            );

          case AirRaidStatus.none:
            return LinearGradient(
              colors: [Color(0xFF01A558), Color(0xFF7AFC68)],
            );

          case null:
            return LinearGradient(
              colors: [Color(0xFF7EC8F2), Color(0xFFAADBF7)],
            );
        }
    }
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.state});
  final RegionState state;
  @override
  Widget build(BuildContext context) {
    if (state.status == RegionStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.status == RegionStatus.initial) {
      return Center(
        child: Image.network(
          'https://res.cloudinary.com/dz8qshbfg/image/upload/f_auto,q_auto/image_city_yicmmx',
        ),
      );
    }
    if (state.status == RegionStatus.error) {
      return Center(child: Text('Error loading alerts'));
    }
    if (state.status == RegionStatus.loaded) {
      switch (state.airRaidStatus) {
        case AirRaidStatus.active:
        case AirRaidStatus.partial:
          return Center(child: Image.asset('assets/images/Alarm.png'));
        case AirRaidStatus.none:
          return Center(child: Image.asset('assets/images/No alarm.png'));
        case null:
          return Center(child: Text('Empty data'));
      }
    }
    return const SizedBox.shrink();
  }
}

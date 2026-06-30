import 'package:air_alerts_map/features/alerts/data/repository/region_repository.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_cubit.dart';
import 'package:air_alerts_map/features/alerts/presentation/bloc/region_state.dart';
import 'package:air_alerts_map/features/alerts/presentation/utils/region_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionAlertsScreen extends StatelessWidget {
  const RegionAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionCubit, RegionState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(gradient: _gradient(state.airRaidStatus)),
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
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.refresh),
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
                    child: Image.network(
                      'https://res.cloudinary.com/dz8qshbfg/image/upload/f_auto,q_auto/image_city_yicmmx',
                    ),
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

  LinearGradient _gradient(AirRaidStatus? status) {
    switch (status) {
      case AirRaidStatus.active:
        return const LinearGradient(
          colors: [Color(0xFFA30000), Color(0xFFFF2E2E)],
        );

      case AirRaidStatus.partial:
        return const LinearGradient(
          colors: [Color(0xFF01A558), Color(0xFF7AFC68)],
        );

      case AirRaidStatus.none:
      case null:
        return const LinearGradient(
          colors: [Color(0xFF7EC8F2), Color(0xFFAADBF7)],
        );
    }
  }
}

class RegionDropdown extends StatelessWidget {
  const RegionDropdown({super.key, this.onSelected, this.initialSelection});

  final ValueChanged<Region?>? onSelected;

  final Region? initialSelection;

  static const _entryStyle = ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Color.fromARGB(221, 5, 4, 4)),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(14));

    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<Region>(
        initialSelection: initialSelection,
        enableSearch: true,
        enableFilter: true,
        requestFocusOnTap: true,
        hintText: 'Оберіть місто або регіон',
        leadingIcon: const Icon(Icons.search, color: Color(0xFF8BB8D6)),
        textStyle: const TextStyle(fontSize: 16, color: Colors.black87),
        onSelected: onSelected,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.7),
          border: border,
          enabledBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.8)),
          ),
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.white),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          hintStyle: TextStyle(
            color: Colors.black.withValues(alpha: 0.4),
            fontSize: 16,
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          elevation: const WidgetStatePropertyAll(8),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8),
          ),
        ),
        dropdownMenuEntries: Region.values
            .map(
              (region) => DropdownMenuEntry<Region>(
                value: region,
                label: region.label,
                style: _entryStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/homescreens/dashdiets/ui/dash_diet_view.dart';
import 'package:well_path/features/settings/weightlosstracker/cubit/weight_loss_cubit.dart';
import 'package:well_path/features/settings/weightlosstracker/weight_loss_settings_page.dart';

class WeightLossRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case "/":
        getIt<AuthStore>().setIsComingFromSettings(true);
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<WeightLossSettingCubit>(),
                  child: const WeightLossSettingPage(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const DashDietPage());
    }
  }
}

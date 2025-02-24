import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/di/injectable.dart';
import 'package:well_path/features/homescreens/healthylivings/cubit/healthy_living_details_cubit.dart';
import 'package:well_path/features/homescreens/healthylivings/models/healthy_living_model.dart';
import 'package:well_path/features/homescreens/healthylivings/ui/healthy_living_detail_view.dart';
import 'package:well_path/features/homescreens/healthylivings/ui/healthy_living_view.dart';

class HealthyLivingRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings route) {
    final args = route.arguments;
    switch (route.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HealthyLivingPage());
      case "/detail":
        HealthyLivingContent healthyLivingContent =
            args as HealthyLivingContent;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>getIt<HealthyLivingDetailsCubit>(),
                  child: HealthyLivingDetailsPage(
                    detail: healthyLivingContent,
                  ),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HealthyLivingPage());
    }
  }
}

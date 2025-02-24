import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/di/locator/service_locator.dart';
import 'package:well_path/features/homescreens/trends/cubit/bp_trends_cubit.dart';
import 'package:well_path/features/homescreens/trends/network/response/bp_trends_bar_graph_response.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';
import 'package:well_path/features/homescreens/trends/ui/hypotension/hypotension_view.dart';

class TrendsRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings route) {
    final args = route.arguments;
    switch (route.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<BPTrendsCubit>(),
                  child: const BpTrendsPage(),
                ));
      case "/detail":
       var bpCategoryDetail = args as BPTrendsBarChartListItem;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<BPTrendsCubit>(),
                  child: BPCategoryDetailPage(bpCategoryDetail: bpCategoryDetail),
                ));

      default:
        return MaterialPageRoute(builder: (_) => const BpTrendsPage());
    }
  }
}

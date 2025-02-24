import 'package:flutter/material.dart';
import 'package:well_path/features/homescreens/home/ui/dashboard_bp.dart';
import 'package:well_path/features/homescreens/trends/ui/bp_trends/bp_trends_view.dart';

import '../features/authenthication/login/ui/login_page.dart';

class HomeRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings route) {
    final args = route.arguments;
    switch (route.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const DashBoardBp());
      case "/trend":
        return MaterialPageRoute(builder: (_) => const BpTrendsPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}

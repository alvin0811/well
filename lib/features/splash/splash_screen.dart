import 'dart:async';
import 'package:flutter/material.dart';
import 'package:well_path/data/local/auth_store.dart';
import 'package:well_path/features/authenthication/login/ui/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';
  const SplashScreen({required this.authStore, Key? key}) : super(key: key);
  final AuthStore authStore;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).popAndPushNamed(LoginPage.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wellpath_splash.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

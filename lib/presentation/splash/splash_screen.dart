import 'package:flutter/material.dart';
import 'package:localization_sample/locale/app_localizations.dart';
import 'package:localization_sample/strings/route_names.dart';
import 'package:localization_sample/strings/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => Navigator.pushReplacementNamed(context, RouteNames.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // TODO 12: set the text as follows
        child: Text(AppLocalizations.of(context)!.translate(AppStrings.loading)!),
      ),
    );
  }
}

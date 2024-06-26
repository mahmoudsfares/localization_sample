import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:localization_sample/di/di.dart';
import 'package:localization_sample/locale/app_localizations_setup.dart';
import 'package:localization_sample/presentation/splash/splash_screen.dart';
import 'package:localization_sample/presentation/text/text_screen.dart';
import 'package:localization_sample/strings/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO 9: initiate shared preferences and get the current locale
  await Dependencies.setPreferences();
  // TODO 10: surround root widget with phoenix to restart the app on locale change
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // TODO 11: provide material app with the required localization settings
      // UI adjustments
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      // supported languages
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      // initial locale
      locale: Dependencies.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        RouteNames.splash: (context) => const SplashScreen(),
        RouteNames.text: (context) => const TextScreen(),
      },
    );
  }
}

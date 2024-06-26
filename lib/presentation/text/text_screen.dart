import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:localization_sample/di/di.dart';
import 'package:localization_sample/locale/app_localizations.dart';
import 'package:localization_sample/strings/app_strings.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context)!.translate(AppStrings.text)!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Dependencies.changeLang();
          // TODO 13: restart the app using Phoenix.rebirth for the new locale to take effect
          Future.delayed(Duration.zero, () => Phoenix.rebirth(context));
        },
        child: const Icon(Icons.translate),
      ),
    );
  }
}

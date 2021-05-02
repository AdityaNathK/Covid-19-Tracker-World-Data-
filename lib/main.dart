//** COMMIT MESSAGE : Localization Implementation Success Proceeding Further**/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gruharaksha/pages/homepage.dart';
import 'package:gruharaksha/translation/bloc/translation_bloc.dart';
import 'package:gruharaksha/translation/global_translation.dart';
import 'data/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// Initialization of the translations based on supported language
  /// and the  fallback language (Optional)
  ///
  List<String> supportedLanguages = ["en", "fr", "hi", "zh", "ru"];
  await translations.init(supportedLanguages, fallbackLanguage: 'en');

  return runApp(BlocProvider(
    create: (context) => TranslationBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// I'm using the Translation bloc here to provide the selected language whenever it changes
    /// But after that , you are free to not use Bloc pattern at all
    /// @Required
    return BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale ?? translations.locale,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: translations.supportedLocales(),
            title: 'Covid 19 Tracker Global',
            theme: ThemeData(
              primaryColor: kBackgroundColor,
            ),
            home: HomeScreen(),
          );
        });
  }
}

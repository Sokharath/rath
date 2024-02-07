import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_auth_testing/screens/language_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocal(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocal(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('selectedLanguage');

    if (savedLanguage != null) {
      setLocal(Locale(savedLanguage));
    }
  }

  void setLocal(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('km'), Locale('en')],
          locale: _locale,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LanguageScreen(),
        );
      },
    );
  }
}

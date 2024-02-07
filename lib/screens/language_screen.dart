import 'package:flutter/material.dart';
import 'package:one_auth_testing/component/constanst.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:one_auth_testing/main.dart';
import 'package:one_auth_testing/screens/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  saveLanguageToPreferences(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', languageCode);
  }

  Future<String?> getSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedLanguage');
  }

  @override
  void initState() {
    super.initState();
    checkAndNavigate();
  }

  void checkAndNavigate() async {
    String? savedLanguage = await getSavedLanguage();
    if (savedLanguage != null) {
      MyApp.setLocal(context, Locale(savedLanguage));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Screen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/chat.jpg')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, right: 150),
              child: Text(
                AppLocalizations.of(context)!.chooseyourlanguage,
                style: kTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, top: 20),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    MyApp.setLocal(context, const Locale('km'));
                  });
                  saveLanguageToPreferences('km');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/cambodia.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text('ភាសាខ្មែរ', style: languageText),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, top: 20),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    MyApp.setLocal(context, const Locale('en'));
                  });
                  saveLanguageToPreferences('en');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 300,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/usa.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text(
                          'English',
                          style: languageText,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

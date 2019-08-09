library singun.language;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/messages_all.dart';

Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  const MyLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
Iterable<Locale> supportedLocales = [
  const Locale('en'), // English
  const Locale('zh'), // generic Chinese 'zh'
];

String getLocaleName(Locale locale) {
  if (locale == null) {
    return "";
  }
  final String name = (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
  return Intl.canonicalizedLocale(name);
}

class MyLocalizations {
  static Future<MyLocalizations> load(Locale locale) {
    return loadLanguage().then((localeName) {
      if (localeName == null) {
        localeName = getLocaleName(locale);
      }
      return initializeMessages(localeName).then((_) {
        Intl.defaultLocale = localeName;
        return MyLocalizations();
      });
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
    );
  }

  String get content {
    return Intl.message(
      'Content',
      name: 'content',
    );
  }

  String get wordListPage {
    return Intl.message(
      'Word List',
      name: 'wordListPage',
    );
  }

  String get pluginTestPage {
    return Intl.message(
      'Plugin Test',
      name: 'pluginTestPage',
    );
  }

  String get localizationPage {
    return Intl.message(
      'Localization',
      name: 'localizationPage',
    );
  }

  String get selectLanguagePage {
    return Intl.message(
      'SelectLanguage',
      name: 'selectLanguagePage',
    );
  }
}

MyLocalizations localizedString(BuildContext context) {
  return Localizations.of<MyLocalizations>(context, MyLocalizations);
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    if (locale == null) {
      return false;
    }
    bool supported = false;
    Iterator<Locale> it = supportedLocales.iterator;
    while(it.moveNext()) {
      if (it.current != null && it.current.languageCode == locale.languageCode) {
        supported = true;
        break;
      }
    }
    return supported;
  }

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}

Future saveLanguage(String localeName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("language", localeName);
}

Future<String> loadLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("language");
}
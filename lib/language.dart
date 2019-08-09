library singun.language;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/messages_all.dart';

MyLocalizationsDelegate _dynamicDelegate = const MyLocalizationsDelegate();
Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  _dynamicDelegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const Iterable<Locale> supportedLocales = [
  const Locale('en'), // English
  const Locale('zh'), // generic Chinese 'zh'
];

Future reloadLanguage(String language) async {
  if (_dynamicDelegate != null) {
    await _dynamicDelegate.updateLanguage(language);
  }
}

String getLocaleName(Locale locale) {
  if (locale == null) {
    return "";
  }
  final String name = (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
  return Intl.canonicalizedLocale(name);
}

class MyLocalizations {

  static Future<MyLocalizations> load(String localeName) {
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return MyLocalizations();
    });
  }

  static Future<MyLocalizations> startup(Locale locale) {
    return _loadLanguage().then((localeName) {
      if (localeName == null) {
        localeName = getLocaleName(locale);
      }
      return load(localeName);
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

  Future updateLanguage(String language) async {
    _saveLanguage(language);
    await MyLocalizations.load(language);
  }

  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.startup(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}

Future _saveLanguage(String localeName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("language", localeName);
}

Future<String> _loadLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("language");
}
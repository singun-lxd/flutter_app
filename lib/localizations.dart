import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

void main() => runApp(Demo());

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
      const DemoLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    Iterable<Locale> supportedLocales = [
      const Locale('en'), // English
      const Locale('zh'), // generic Chinese 'zh'
    ];
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => DemoLocalizations.of(context).title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      // Watch out: MaterialApp creates a Localizations widget
      // with the specified delegates. DemoLocalizations.of()
      // will only find the app's Localizations widget if its
      // context is a child of the app.
      home: DemoApp(supportedLocales),
    );
  }
}

class DemoApp extends StatefulWidget {
  final Iterable<Locale> supportedLocales;
  const DemoApp(this.supportedLocales);

  @override
  DemoState createState() => DemoState(this.supportedLocales);
}

class DemoState extends State<DemoApp> {
  final Iterable<Locale> supportedLocales;
  DemoState(this.supportedLocales);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.language), onPressed: _changeLanguage),
        ],
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).content),
      ),
    );
  }

  void _changeLanguage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = supportedLocales.map((Locale locale) {
              String localeName = DemoLocalizations.getLocaleName(locale);
              return ListTile(
                title: Text(
                    localeName
                ),
                onTap: () {
                  setState(() {
                    Intl.defaultLocale = localeName;
                  });
                  Navigator.pop(context);
                },
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: AppBar(
              title: const Text('Languages'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

class DemoLocalizations {
  static String getLocaleName(Locale locale) {
    if (locale == null) {
      return "";
    }
    final String name = (locale.countryCode == null || locale.countryCode.isEmpty) ? locale.languageCode : locale.toString();
    return Intl.canonicalizedLocale(name);
  }
  
  static Future<DemoLocalizations> load(Locale locale) {
    final String localeName = getLocaleName(locale);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
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
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) => DemoLocalizations.load(locale);

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
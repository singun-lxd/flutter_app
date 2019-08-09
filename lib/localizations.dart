import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'language.dart' as language;

class LocalePage extends StatefulWidget {
  final Iterable<Locale> supportedLocales;
  const LocalePage(this.supportedLocales);

  @override
  LocalePageState createState() => LocalePageState(this.supportedLocales);
}

class LocalePageState extends State<LocalePage> {
  final Iterable<Locale> supportedLocales;
  LocalePageState(this.supportedLocales);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.localizedString(context).localizationPage),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.language), onPressed: _changeLanguage),
        ],
      ),
      body: Center(
        child: Text(language.localizedString(context).content),
      ),
    );
  }

  void _changeLanguage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = supportedLocales.map((Locale locale) {
              String localeName = language.getLocaleName(locale);
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
          ).toList();

          return new Scaffold(
            appBar: AppBar(
              title: Text(language.localizedString(context).selectLanguagePage),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

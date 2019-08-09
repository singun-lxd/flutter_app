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
          String curLocale = Intl.defaultLocale;
          final Iterable<ListTile> tiles = supportedLocales.map((Locale locale) {
              String localeName = language.getLocaleName(locale);
              bool isCurrent = false;
              if (localeName != null && localeName.compareTo(curLocale) == 0) {
                isCurrent = true;
              }
              return ListTile(
                title: Text(localeName),
                trailing: Icon(
                  isCurrent ? Icons.check : null,
                ),
                onTap: () {
                  if (isCurrent) {
                    return;
                  }
                  setState(() {
                    Intl.defaultLocale = localeName;
                  });
                  language.saveLanguage(localeName);
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

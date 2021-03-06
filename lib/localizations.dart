import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_widget_compat.dart';
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
    return CompatScaffold(
      appBar: CompatAppBar(
        title: Text(language.localizedString(context).localizationPage),
        trailingActions: [
          CompatIconButton(icon: const Icon(Icons.language), onPressed: _changeLanguage),
        ],
      ),
      body: Center(
        child: Text(language.localizedString(context).content),
      ),
    );
  }

  void _changeLanguage() {
    Navigator.of(context).push(
      compatPageRoute<void>(builder: (BuildContext context) {
        String curLocale = Intl.defaultLocale;
        final Iterable<Widget> tiles = supportedLocales.map((Locale locale) {
          String localeName = language.getLocaleName(locale);
          bool isCurrent = false;
          if (curLocale != null && localeName != null && localeName.compareTo(curLocale) == 0) {
            isCurrent = true;
          }
          return Material(child:
              ListTile(
                title: Text(localeName),
                trailing: Icon(
                  isCurrent ? (isMaterial ? Icons.check : CupertinoIcons.check_mark) : null,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  if (isCurrent) {
                    return;
                  }
                  setState(() {
                    language.reloadLanguage(localeName).then((_) {
                      Navigator.pop(context);
                    });
                  });
                },
              ),
          );
        },
        );
        final List<Widget> divided = ListTile
            .divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return new CompatScaffold(
          appBar: CompatAppBar(
            title: Text(language.localizedString(context).selectLanguagePage),
          ),
          body: ListView(children: divided),
        );
      },)
    );
  }
}

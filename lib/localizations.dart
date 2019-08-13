import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_package.dart';
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(language.localizedString(context).localizationPage),
        action: PlatformIconButton(icon: const Icon(Icons.language), onPressed: _changeLanguage),
      ),
      body: Center(
        child: Text(language.localizedString(context).content),
      ),
    );
  }

  void _changeLanguage() {
    Navigator.of(context).push(
      PlatformPageRoute.createVoidRoute(builder: (BuildContext context) {
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
                  isCurrent ? Icons.check : null,
                  color: Colors.blueAccent,
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

        return new PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text(language.localizedString(context).selectLanguagePage),
          ),
          body: ListView(children: divided),
        );
      },)
    );
  }
}

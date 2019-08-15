// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_widget_compat.dart';

import 'localizations.dart';
import 'plugin.dart';
import 'word_list.dart';
import 'language.dart' as language;

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return CompatSupportWidget(
      builder: (BuildContext context) => CompatApp(
        onGenerateTitle: (BuildContext context) => language.localizedString(context).title,
        localizationsDelegates: language.localizationsDelegates,
        supportedLocales: language.supportedLocales,
        material: (_) => MaterialAppData(theme: ThemeData(
          primarySwatch: Colors.pink,
        )),
        cupertino: (_) => CupertinoAppData(theme: CupertinoThemeData(
          primaryColor: Colors.pink,
        )),
        home: _MainPage(),
      ),
    );
  }
}

class _MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  @override
  Widget build(BuildContext context) {
    return CompatScaffold(
      appBar: CompatAppBar(
        title: Text(language.localizedString(context).title),
        trailingActions: <Widget>[
          CompatIconButton(
            materialIcon: Icon(Icons.settings),
            cupertinoIcon: Icon(CupertinoIcons.settings),
            onPressed: () { _switchPlatform(context);}
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CompatButton(
              child: Text(language.localizedString(context).wordListPage),
              onPressed: _showWordPage,
            ),
            CompatButton(
              child: Text(language.localizedString(context).pluginTestPage),
              onPressed: _showPluginPage,
            ),
            CompatButton(
              child: Text(language.localizedString(context).localizationPage),
              onPressed: _showLocalizationPage,
            ),
            CompatButton(
              child: Text(MaterialLocalizations.of(context).dialogLabel),
              onPressed: _showDialog,
            ),
          ],
        ),
      )
    );
  }

  void _switchPlatform(BuildContext context) {
    if (isMaterial) {
      CompatSupportWidget.of(context).setCompatMode(CompatMode.Cupertino);
    } else {
      CompatSupportWidget.of(context).setCompatMode(CompatMode.Material);
    }
  }

  void _showWordPage() {
    Navigator.of(context).push(
      compatPageRoute<void>(builder: (BuildContext context) {
        return RandomWords();
      })
    );
  }

  void _showPluginPage() {
    Navigator.of(context).push(
        compatPageRoute<void>(builder: (BuildContext context) {
        return PluginPage();
      })
    );
  }

  void _showLocalizationPage() {
    Navigator.of(context).push(
        compatPageRoute<void>(builder: (BuildContext context) {
        return LocalePage(language.supportedLocales);
      })
    );
  }

  void _showDialog() {
    showCompatDialog(
        context: context,
        builder: (context) {
          return new CompatAlertDialog(
            title: new Text("Dialog"),
            content: new Text("Content"),
            actions: <Widget>[
              CompatFlatButton(
                onPressed: () {
                  Navigator.pop(context, "Cancel");
                },
                child: CompatText(MaterialLocalizations.of(context).cancelButtonLabel)),
              CompatFlatButton(
                onPressed: () {
                  Navigator.pop(context, "OK");
                },
                child: CompatText(MaterialLocalizations.of(context).okButtonLabel),
              )
            ],
          );
        });
  }
}
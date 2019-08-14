// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
    return CompatApp(
      onGenerateTitle: (BuildContext context) => language.localizedString(context).title,
      localizationsDelegates: language.localizationsDelegates,
      supportedLocales: language.supportedLocales,
      home: _MainPage(),
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
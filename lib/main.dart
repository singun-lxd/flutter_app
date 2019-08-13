// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_package.dart';

import 'localizations.dart';
import 'plugin.dart';
import 'word_list.dart';
import 'language.dart' as language;

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(language.localizedString(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlatformButton(
              child: Text(language.localizedString(context).wordListPage),
              onPressed: _showWordPage,
            ),
            PlatformButton(
              child: Text(language.localizedString(context).pluginTestPage),
              onPressed: _showPluginPage,
            ),
            PlatformButton(
              child: Text(language.localizedString(context).localizationPage),
              onPressed: _showLocalizationPage,
            ),
            PlatformButton(
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
      PlatformPageRoute.createVoidRoute(builder: (BuildContext context) {
        return RandomWords();
      })
    );
  }

  void _showPluginPage() {
    Navigator.of(context).push(
      PlatformPageRoute.createVoidRoute(builder: (BuildContext context) {
        return PluginPage();
      })
    );
  }

  void _showLocalizationPage() {
    Navigator.of(context).push(
      PlatformPageRoute.createVoidRoute(builder: (BuildContext context) {
        return LocalePage(language.supportedLocales);
      })
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return new PlatformAlertDialog(
            title: new Text("Dialog"),
            content: new Text("Content"),
            actions: <Widget>[
              PlatformButton(
                  onPressed: () {
                    Navigator.pop(context, "Cancel");
                  },
                  child: Text(MaterialLocalizations.of(context).cancelButtonLabel)),
              PlatformButton(
                onPressed: () {
                  Navigator.pop(context, "OK");
                },
                child: Text(MaterialLocalizations.of(context).okButtonLabel),
              )
            ],
          );
        });
  }
}
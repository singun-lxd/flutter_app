// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';

import 'localizations.dart';
import 'plugin.dart';
import 'word_list.dart';
import 'language.dart' as language;

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Scaffold(
      appBar: AppBar(
        title: Text(language.localizedString(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(language.localizedString(context).wordListPage),
              onPressed: _showWordPage,
            ),
            RaisedButton(
              child: Text(language.localizedString(context).pluginTestPage),
              onPressed: _showPluginPage,
            ),
            RaisedButton(
              child: Text(language.localizedString(context).localizationPage),
              onPressed: _showLocalizationPage,
            ),
            RaisedButton(
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
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return RandomWords();
        },
      ),
    );
  }

  void _showPluginPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return PluginPage();
        },
      ),
    );
  }

  void _showLocalizationPage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return LocalePage(language.supportedLocales);
        },
      ),
    );
  }

  void _showDialog() {
    Calculator calculator = Calculator();
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: new Text(MaterialLocalizations.of(context).alertDialogLabel),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text(calculator.addOne(0).toString()),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption One");
                },
              ),
              new SimpleDialogOption(
                child: new Text(calculator.addOne(1).toString()),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Two");
                },
              ),
              new SimpleDialogOption(
                child: new Text(calculator.addOne(2).toString()),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Three");
                },
              ),
            ],
          );
        });
  }
}
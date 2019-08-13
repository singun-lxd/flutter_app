library flutter_package;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin PlatformRouteMixin<T, A extends PageRoute<T>, I extends PageRoute<T>> {
  A createAndroidPageRoute(WidgetBuilder builder, [RouteSettings settings]);

  I createIosPageRoute(WidgetBuilder builder, [RouteSettings settings]);

  PageRoute<T> create(WidgetBuilder builder, [RouteSettings settings]) {
    if (Platform.isIOS) {
      return createAndroidPageRoute(builder, settings);
    }
    return createIosPageRoute(builder, settings);
  }
}

class PlatformPageRoute<T> with PlatformRouteMixin<T, MaterialPageRoute<T>, CupertinoPageRoute<T>> {
  @override
  MaterialPageRoute<T> createAndroidPageRoute(WidgetBuilder builder, [RouteSettings settings]) {
    return MaterialPageRoute<T>(
        builder: builder,
        settings: settings,
    );
  }

  @override
  CupertinoPageRoute<T> createIosPageRoute(WidgetBuilder builder, [RouteSettings settings]) {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
    );
  }

  static PlatformPageRoute voidCreator = new PlatformPageRoute<void>();
  static PageRoute<void> createVoidRoute({@required WidgetBuilder builder}) {
    return voidCreator.create(builder);
  }
}

mixin PlatformWidgetMixin<A extends Widget, I extends Widget> {
  A createAndroidWidget(BuildContext context);

  I createIosWidget(BuildContext context);

  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return createAndroidWidget(context);
  }
}

class PlatformApp extends StatelessWidget
    with PlatformWidgetMixin<MaterialApp, CupertinoApp> {

  final Widget home;
  final GenerateAppTitle onGenerateTitle;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  const PlatformApp({
    this.home,
    this.onGenerateTitle,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
  });

  @override
  MaterialApp createAndroidWidget(BuildContext context) {
    return MaterialApp(
      home: home,
      onGenerateTitle: onGenerateTitle,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  @override
  CupertinoApp createIosWidget(BuildContext context) {
    return CupertinoApp(
      home: home,
      onGenerateTitle: onGenerateTitle,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

}

class PlatformScaffold extends StatelessWidget
    with PlatformWidgetMixin<Scaffold, CupertinoPageScaffold> {

  final PlatformAppBar appBar;
  final Widget body;

  const PlatformScaffold({this.appBar, this.body});

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar.createAndroidWidget(context),
      body: body,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBar.createIosWidget(context),
      child: body,
    );
  }
}

class PlatformAppBar extends StatelessWidget
    with PlatformWidgetMixin<AppBar, CupertinoNavigationBar> {
  final Widget title;
  final Widget leading;
  final Widget action;

  const PlatformAppBar({this.title, this.leading, this.action});

  @override
  AppBar createAndroidWidget(BuildContext context) {
    return new AppBar(leading: leading, title: title, actions: action != null ? [action] : null,);
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    return new CupertinoNavigationBar(leading: leading, middle: title, trailing: action);
  }

}

class PlatformAlertDialog extends StatelessWidget
    with PlatformWidgetMixin<AlertDialog, CupertinoAlertDialog> {

  final Widget title;
  final Widget content;
  final List<Widget> actions;

  const PlatformAlertDialog({this.title, this.content, this.actions});

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return new AlertDialog(title: title, content: content, actions: actions,);
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return new CupertinoAlertDialog(
      title: title, content: content, actions: actions,);
  }
}

class PlatformSwicth extends StatelessWidget
    with PlatformWidgetMixin<Switch, CupertinoSwitch> {

  final bool value;
  final ValueChanged<bool> onChanged;

  const PlatformSwicth({this.value, this.onChanged});

  @override
  Switch createAndroidWidget(BuildContext context) {
    return new Switch(value: value, onChanged: onChanged);
  }

  @override
  CupertinoSwitch createIosWidget(BuildContext context) {
    return new CupertinoSwitch(value: value, onChanged: onChanged);
  }
}

class PlatformButton extends StatelessWidget
    with PlatformWidgetMixin<MaterialButton, CupertinoButton> {

  final VoidCallback onPressed;
  final Widget child;

  const PlatformButton({this.onPressed, this.child});

  @override
  MaterialButton createAndroidWidget(BuildContext context) {
    return new MaterialButton(onPressed: onPressed, child: child);
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return new CupertinoButton(child: child, onPressed: onPressed);
  }
}

class PlatformIconButton extends StatelessWidget
    with PlatformWidgetMixin<IconButton, CupertinoButton> {

  final Widget icon;
  final VoidCallback onPressed;

  const PlatformIconButton({this.icon, this.onPressed});

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return new IconButton(icon: icon, onPressed: onPressed);
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return new CupertinoButton(child: icon, onPressed: onPressed);
  }
}
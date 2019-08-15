
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/compat.dart';

Future<T> showCompatDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  materialBarrierDismissible = false,
}) {
  if (isCupertino) {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
    );
  } else {
    return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: materialBarrierDismissible);
  }
}

PageRoute<T> compatPageRoute<T>({
  WidgetBuilder builder,
  RouteSettings settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String cupertinoTitle,
}) {
  if (isCupertino) {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      title: cupertinoTitle,
    );
  } else {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}

Color compatThemePrimaryColor(BuildContext context) {
  if (isCupertino) {
    return CupertinoTheme.of(context).primaryColor;
  } else {
    return Theme.of(context).primaryColor;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/compat.dart';

Future<T> showCompatDialog<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
  materialBarrierDismissible = false,
}) {
  if (isMaterial) {
    return showDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: materialBarrierDismissible);
  } else {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
    );
  }
}

PageRoute<T> compatPageRoute<T>({
  WidgetBuilder builder,
  RouteSettings settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String cupertinoTitle,
}) {
  if (isMaterial) {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return CupertinoPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      title: cupertinoTitle,
    );
  }
}
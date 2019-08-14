import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.actions, this.content, this.title});

  final Key widgetKey;
  final List<Widget> actions;
  final Widget content;
  final Widget title;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData(
      {Key widgetKey,
      List<Widget> actions,
      Widget content,
      Widget title,
      this.contentTextStyle,
      this.backgroundColor,
      this.elevation,
      this.shape,
      this.contentPadding,
      this.semanticLabel,
      this.titlePadding,
      this.titleTextStyle})
      : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final EdgeInsetsGeometry contentPadding;
  final String semanticLabel;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle contentTextStyle;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
  final TextStyle titleTextStyle;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData(
      {Key widgetKey,
      List<Widget> actions,
      Widget content,
      Widget title,
      this.scrollController,
      this.actionScrollController})
      : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final ScrollController scrollController;
  final ScrollController actionScrollController;
}

class CompatAlertDialog
    extends BaseCompatWidget<CupertinoAlertDialog, AlertDialog> {
  final Key widgetKey;
  final List<Widget> actions;
  final Widget content;
  final Widget title;

  final CompatBuilder<MaterialAlertDialogData> material;
  final CompatBuilder<CupertinoAlertDialogData> cupertino;

  const CompatAlertDialog(
      {Key key,
      this.widgetKey,
      this.actions,
      this.content,
      this.title,
      this.cupertino,
      this.material})
      : super(key: key);

  @override
  AlertDialog materialWidget(BuildContext context) {
    MaterialAlertDialogData data;
    if (material != null) {
      data = material(context);
    }

    return AlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      semanticLabel: data?.semanticLabel,
      title: data?.title ?? title,
      titlePadding: data?.titlePadding,
      contentTextStyle: data?.contentTextStyle,
      backgroundColor: data?.backgroundColor,
      elevation: data?.elevation,
      shape: data?.shape,
      titleTextStyle: data?.titleTextStyle,
    );
  }

  @override
  CupertinoAlertDialog cupertinoWidget(BuildContext context) {
    CupertinoAlertDialogData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoAlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
    );
  }
}

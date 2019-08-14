import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;
}

class MaterialDialogActionData extends _BaseData {
  MaterialDialogActionData({
    Widget child,
    VoidCallback onPressed,
    this.widgetKey,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledTextColor,
    this.highlightColor,
    this.onHighlightChanged,
    this.padding,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
  }) : super(child: child, onPressed: onPressed);

  final Key widgetKey;
  final Color color;
  final Brightness colorBrightness;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color highlightColor;
  final ValueChanged<bool> onHighlightChanged;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
}

class CupertinoDialogActionData extends _BaseData {
  CupertinoDialogActionData(
      {Widget child,
      VoidCallback onPressed,
      this.isDefaultAction,
      this.isDestructiveAction,
      this.textStyle})
      : super(child: child, onPressed: onPressed);

  final bool isDefaultAction;
  final bool isDestructiveAction;
  final TextStyle textStyle;
}

class CompatDialogAction
    extends BaseCompatWidget<CupertinoDialogAction, FlatButton> {
  final Key widgetKey;
  final Widget child;
  final VoidCallback onPressed;

  final CompatBuilder<MaterialDialogActionData> material;
  final CompatBuilder<CupertinoDialogActionData> cupertino;

  const CompatDialogAction(
      {Key key,
      this.widgetKey,
      @required this.child,
      @required this.onPressed,
      this.material,
      this.cupertino})
      : super(key: key);
  @override
  FlatButton materialWidget(BuildContext context) {
    MaterialDialogActionData data;
    if (material != null) {
      data = material(context);
    }

    return FlatButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
      color: data?.color,
      colorBrightness: data?.colorBrightness,
      disabledColor: data?.disabledColor,
      disabledTextColor: data?.disabledTextColor,
      highlightColor: data?.highlightColor,
      onHighlightChanged: data?.onHighlightChanged,
      padding: data?.padding,
      shape: data?.shape,
      splashColor: data?.splashColor,
      textColor: data?.textColor,
      textTheme: data?.textTheme,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      materialTapTargetSize: data?.materialTapTargetSize,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
    );
  }

  @override
  CupertinoDialogAction cupertinoWidget(BuildContext context) {
    CupertinoDialogActionData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoDialogAction(
      child: data?.child ?? child,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      onPressed: data?.onPressed ?? onPressed,
      textStyle: data?.textStyle,
    );
  }
}

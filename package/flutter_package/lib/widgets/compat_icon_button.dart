import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.icon,
      this.onPressed,
      this.padding,
      this.color,
      this.disabledColor});

  final Key widgetKey;
  final Icon icon;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Color color;
  final Color disabledColor;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData(
      {Key widgetKey,
      Icon icon,
      VoidCallback onPressed,
      EdgeInsets padding,
      Color color,
      Color disabledColor,
      this.borderRadius,
      this.minSize,
      this.pressedOpacity})
      : super(
            widgetKey: widgetKey,
            icon: icon,
            onPressed: onPressed,
            padding: padding,
            color: color,
            disabledColor: disabledColor);

  final BorderRadius borderRadius;
  final double minSize;
  final double pressedOpacity;
}

class MaterialIconButtonData extends _BaseData {
  MaterialIconButtonData({
    Key widgetKey,
    Icon icon,
    VoidCallback onPressed,
    EdgeInsets padding,
    Color color,
    Color disabledColor,
    this.alignment,
    this.highlightColor,
    this.iconSize = 24.0,
    this.splashColor,
    this.tooltip,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
  }) : super(
            widgetKey: widgetKey,
            icon: icon,
            onPressed: onPressed,
            padding: padding,
            color: color,
            disabledColor: disabledColor);

  final AlignmentGeometry alignment;
  final Color highlightColor;
  final double iconSize;
  final Color splashColor;
  final String tooltip;
  final Color focusColor;
  final Color hoverColor;
  final FocusNode focusNode;
}

class CompatIconButton extends BaseCompatWidget<CupertinoButton, IconButton> {
  final Key widgetKey;

  final Icon icon;
  final Icon cupertinoIcon;
  final Icon materialIcon;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets padding;
  final Color disabledColor;

  final CompatBuilder<MaterialIconButtonData> material;
  final CompatBuilder<CupertinoIconButtonData> cupertino;

  const CompatIconButton(
      {Key key,
      this.widgetKey,
      this.icon,
      this.cupertinoIcon,
      this.materialIcon,
      this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.material,
      this.cupertino})
      : super(key: key);

  @override
  IconButton materialWidget(BuildContext context) {
    MaterialIconButtonData data;
    if (material != null) {
      data = material(context);
    }

    return IconButton(
      key: data?.widgetKey ?? widgetKey,
      icon: data?.icon ?? materialIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(8.0),
      color: data?.color ?? color,
      alignment: data?.alignment ?? Alignment.center,
      disabledColor: data?.disabledColor ?? disabledColor,
      highlightColor: data?.highlightColor,
      iconSize: data?.iconSize ?? 24.0,
      splashColor: data?.splashColor,
      tooltip: data?.tooltip,
      focusColor: data?.focusColor,
      focusNode: data?.focusNode,
      hoverColor: data?.hoverColor,
    );
  }

  @override
  CupertinoButton cupertinoWidget(BuildContext context) {
    CupertinoIconButtonData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoButton(
      key: data?.widgetKey ?? widgetKey,
      child: data?.icon ?? cupertinoIcon ?? icon,
      onPressed: data?.onPressed ?? onPressed,
      padding: data?.padding ?? padding ?? const EdgeInsets.all(0.0),
      color: data?.color ?? color,
      borderRadius: data?.borderRadius ??
          const BorderRadius.all(const Radius.circular(8.0)),
      minSize: data?.minSize ?? 44.0,
      pressedOpacity: data?.pressedOpacity ?? 0.1,
      disabledColor: data?.disabledColor ?? disabledColor,
    );
  }
}

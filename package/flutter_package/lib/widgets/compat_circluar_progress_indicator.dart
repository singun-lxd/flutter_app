import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

const double _kDefaultIndicatorRadius = 10.0;

class MaterialProgressIndicatorData {
  MaterialProgressIndicatorData({
    this.key,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
  });
  final Key key;
  final Color backgroundColor;
  final double strokeWidth;
  final double value;
  final Animation<Color> valueColor;
  final String semanticsLabel;
  final String semanticsValue;
}

class CupertinoProgressIndicatorData {
  CupertinoProgressIndicatorData({
    this.key,
    this.animating,
    this.radius: _kDefaultIndicatorRadius,
  });

  final Key key;
  final bool animating;
  final double radius;
}

class CompatCircularProgressIndicator extends BaseCompatWidget<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final Key widgetKey;

  final CompatBuilder<MaterialProgressIndicatorData> material;
  final CompatBuilder<CupertinoProgressIndicatorData> cupertino;

  const CompatCircularProgressIndicator({
    Key key,
    this.widgetKey,
    this.material,
    this.cupertino,
  }) : super(key: key);

  @override
  CircularProgressIndicator materialWidget(BuildContext context) {
    MaterialProgressIndicatorData data;
    if (material != null) {
      data = material(context);
    }

    return CircularProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
    );
  }

  @override
  CupertinoActivityIndicator cupertinoWidget(BuildContext context) {
    CupertinoProgressIndicatorData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoActivityIndicator(
      key: data?.key ?? widgetKey,
      animating: data?.animating ?? true,
      radius: data?.radius ?? _kDefaultIndicatorRadius,
    );
  }
}

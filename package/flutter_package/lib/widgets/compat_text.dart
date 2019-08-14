import 'package:flutter/widgets.dart';

import 'package:flutter_package/base/compat.dart' show isMaterial;

String formatData(String data) {
  if (isMaterial) {
    return data?.toUpperCase();
  }
  return data;
}

class CompatText extends StatelessWidget {
  final Text _text;

  CompatText(
    String data, {
    Key key,
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    Locale locale,
    String semanticsLabel,
    StrutStyle strutStyle,
    TextWidthBasis textWidthBasis,
  })  : _text = Text(
          formatData(data),
          key: key,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          locale: locale,
          semanticsLabel: semanticsLabel,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _text;
  }
}

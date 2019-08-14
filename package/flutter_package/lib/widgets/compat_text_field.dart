import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'package:flutter_package/base/compat.dart';
import 'widget_base.dart';

const TextStyle _kDefaultTextStyle = TextStyle(
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.38,
  color: CupertinoColors.black,
  decoration: TextDecoration.none,
);
const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoColors.lightBackgroundGray,
  style: BorderStyle.solid,
  width: 0.0,
);
const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);
const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

class MaterialTextFieldData {
  MaterialTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.textDirection,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.onTap,
    this.buildCounter,
    this.dragStartBehavior,
    this.expands,
    this.minLines,
    this.scrollPhysics,
    this.strutStyle,
    this.scrollController,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final GestureTapCallback onTap;
  final InputCounterWidgetBuilder buildCounter;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final ScrollController scrollController;
}

class CupertinoTextFieldData {
  CupertinoTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.dragStartBehavior,
    this.expands,
    this.minLines,
    this.scrollPhysics,
    this.strutStyle,
    this.enableInteractiveSelection,
    this.scrollController,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final TextStyle placeholderStyle;
  final Widget prefix;
  final OverlayVisibilityMode prefixMode;
  final Widget suffix;
  final OverlayVisibilityMode suffixMode;
  final OverlayVisibilityMode clearButtonMode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final bool enableInteractiveSelection;
  final ScrollController scrollController;
}

class CompatTextField
    extends BaseCompatWidget<CupertinoTextField, TextField> {
  final Key widgetKey;

  final CompatBuilder<MaterialTextFieldData> material;
  final CompatBuilder<CupertinoTextFieldData> cupertino;

  final TextEditingController controller;
  final FocusNode focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final ScrollController scrollController;

  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;

  CompatTextField(
      {Key key,
      this.widgetKey,
      this.controller,
      this.focusNode,
      TextInputType keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      TextStyle style,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.obscureText = false,
      this.autocorrect = true,
      this.maxLines = 1,
      this.maxLength,
      this.maxLengthEnforced = true,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorRadius,
      Color cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.dragStartBehavior,
      this.minLines,
      this.expands,
      this.scrollPhysics,
      this.strutStyle,
      this.scrollController,
      this.material,
      this.cupertino})
      : cursorColor =
            cursorColor ?? (isMaterial ? null : CupertinoColors.activeBlue),
        style = style ?? (isMaterial ? null : _kDefaultTextStyle),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  @override
  TextField materialWidget(BuildContext context) {
    MaterialTextFieldData data;
    if (material != null) {
      data = material(context);
    }

    return TextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: data?.decoration ?? const InputDecoration(),
      textDirection: data?.textDirection,
      enableInteractiveSelection: data?.enableInteractiveSelection ?? false,
      onTap: data?.onTap,
      buildCounter: data?.buildCounter,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      scrollController: data?.scrollController ?? scrollController,
    );
  }

  @override
  CupertinoTextField cupertinoWidget(BuildContext context) {
    CupertinoTextFieldData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoTextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: data?.decoration ?? _kDefaultRoundedBorderDecoration,
      clearButtonMode: data?.clearButtonMode ?? OverlayVisibilityMode.never,
      padding: data?.padding ?? const EdgeInsets.all(6.0),
      placeholder: data?.placeholder,
      placeholderStyle: data?.placeholderStyle,
      prefix: data?.prefix,
      prefixMode: data?.prefixMode ?? OverlayVisibilityMode.always,
      suffix: data?.suffix,
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.always,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection,
      scrollController: data?.scrollController ?? scrollController,
    );
  }
}

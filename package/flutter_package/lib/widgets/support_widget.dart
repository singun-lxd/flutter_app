import 'package:flutter/widgets.dart';

import 'package:flutter_package/base/compat.dart' as compat;

class CompatSupportWidget extends StatefulWidget {
  const CompatSupportWidget({
    @required this.builder,
  }) : assert(builder != null);

  final WidgetBuilder builder;

  static CompatSupportWidgetState of(BuildContext context) {
    return context
        .ancestorStateOfType(const TypeMatcher<CompatSupportWidgetState>());
  }

  @override
  CompatSupportWidgetState createState() => CompatSupportWidgetState();
}

class CompatSupportWidgetState extends State<CompatSupportWidget> {
  bool get isCupertino => compat.isCupertino;
  bool get isMaterial => compat.isMaterial;

  void setCompatMode(compat.CompatMode mode) {
    setState(() {
      compat.setCompatMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

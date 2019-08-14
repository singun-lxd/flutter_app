import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

class CompatWidget extends BaseCompatWidget<Widget, Widget> {
  final CompatBuilder<Widget> material;
  final CompatBuilder<Widget> cupertino;

  const CompatWidget({Key key, this.cupertino, this.material}) : super(key: key);

  @override
  Widget materialWidget(BuildContext context) {
    if (material == null) {
      return Container();
    } else {
      return material(context);
    }
  }

  @override
  Widget cupertinoWidget(BuildContext context) {
    if (cupertino == null) {
      return Container();
    } else {
      return cupertino(context);
    }
  }
}

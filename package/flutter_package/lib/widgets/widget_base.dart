import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/compat.dart';

abstract class BaseCompatWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const BaseCompatWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMaterial) {
      return materialWidget(context);
    } else if (isCupertino) {
      return cupertinoWidget(context);
    }
    return null;
  }

  I cupertinoWidget(BuildContext context);

  A materialWidget(BuildContext context);
}

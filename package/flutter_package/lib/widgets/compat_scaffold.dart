import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'compat_app_bar.dart';
import 'compat_nav_bar.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({this.widgetKey, this.backgroundColor, this.body});

  final Color backgroundColor;
  final Widget body;
  final Key widgetKey;
}

class MaterialScaffoldData extends _BaseData {
  MaterialScaffoldData({
    Color backgroundColor,
    Widget body,
    Key widgetKey,
    this.appBar,
    this.bottomNavBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.primary,
    this.resizeToAvoidBottomPadding,
    this.bottomSheet,
    this.drawerDragStartBehavior,
    this.extendBody,
    this.resizeToAvoidBottomInset,
    this.drawerScrimColor,
  }) : super(
            widgetKey: widgetKey, backgroundColor: backgroundColor, body: body);

  final PreferredSizeWidget appBar;
  final Widget bottomNavBar;
  final Widget drawer;
  final Widget endDrawer;
  final Widget floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<Widget> persistentFooterButtons;
  final bool primary;
  final bool resizeToAvoidBottomPadding;
  final Widget bottomSheet;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;
  final Color drawerScrimColor;
}

class CupertinoPageScaffoldData extends _BaseData {
  CupertinoPageScaffoldData({
    Color backgroundColor,
    Widget body,
    Key widgetKey,
    this.navigationBar,
    this.bottomTabBar,
    this.resizeToAvoidBottomInset,
    this.resizeToAvoidBottomInsetTab,
    this.backgroundColorTab,
    this.controller
  }) : super(
            widgetKey: widgetKey, backgroundColor: backgroundColor, body: body);

  final ObstructingPreferredSizeWidget navigationBar;
  final CupertinoTabBar bottomTabBar;
  final bool resizeToAvoidBottomInset;
  final bool resizeToAvoidBottomInsetTab;
  final Color backgroundColorTab;
  final CupertinoTabController controller;
}

class CompatScaffold extends BaseCompatWidget<Widget, Scaffold> {
  final Key widgetKey;

  final Widget body;
  final Color backgroundColor;
  final CompatAppBar appBar;
  final PlatformNavBar bottomNavBar;

  final CompatBuilder<MaterialScaffoldData> material;
  final CompatBuilder<CupertinoPageScaffoldData> cupertino;

  final bool cupertinoContentPadding;
  final bool cupertinoContentBottomPadding;

  const CompatScaffold({
    Key key,
    this.widgetKey,
    this.body,
    this.backgroundColor,
    this.appBar,
    this.bottomNavBar,
    this.material,
    this.cupertino,
    this.cupertinoContentPadding = false,
    this.cupertinoContentBottomPadding = false,
  }) : super(key: key);

  @override
  Scaffold materialWidget(BuildContext context) {
    MaterialScaffoldData data;
    if (material != null) {
      data = material(context);
    }

    return Scaffold(
      key: data?.widgetKey ?? widgetKey,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      body: data?.body ?? body,
      appBar: data?.appBar ?? appBar?.materialWidget(context),
      bottomNavigationBar:
          data?.bottomNavBar ?? bottomNavBar?.materialWidget(context),
      drawer: data?.drawer,
      endDrawer: data?.endDrawer,
      floatingActionButton: data?.floatingActionButton,
      floatingActionButtonAnimator: data?.floatingActionButtonAnimator,
      floatingActionButtonLocation: data?.floatingActionButtonLocation,
      persistentFooterButtons: data?.persistentFooterButtons,
      primary: data?.primary ?? true,
      resizeToAvoidBottomPadding: data?.resizeToAvoidBottomPadding ?? true,
      bottomSheet: data?.bottomSheet,
      drawerDragStartBehavior:
          data?.drawerDragStartBehavior ?? DragStartBehavior.start,
      extendBody: data?.extendBody ?? false,
      resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset,
      drawerScrimColor: data?.drawerScrimColor,
    );
  }

  @override
  Widget cupertinoWidget(BuildContext context) {
    CupertinoPageScaffoldData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    Widget child = body ?? data?.body;
    var navigationBar = appBar?.cupertinoWidget(context) ?? data?.navigationBar;

    Widget result;
    if (bottomNavBar != null) {
      var tabBar = data?.bottomTabBar ?? bottomNavBar?.cupertinoWidget(context);

      //https://docs.flutter.io/flutter/cupertino/CupertinoTabScaffold-class.html
      result = CupertinoTabScaffold(
        key: data?.widgetKey ?? widgetKey,
        backgroundColor: data?.backgroundColorTab,
        resizeToAvoidBottomInset: data?.resizeToAvoidBottomInsetTab ?? true,
        tabBar: tabBar,
        controller: data?.controller,
        tabBuilder: (BuildContext context, int index) {
          return CupertinoPageScaffold(
            backgroundColor: data?.backgroundColor ?? backgroundColor,
            child: cupertinoContentPad(context, child, navigationBar, tabBar),
            navigationBar: navigationBar,
            resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
            // key: widgetKey used for CupertinoTabScaffold
          );
        },
      );
    } else {
      result = CupertinoPageScaffold(
        key: data?.widgetKey ?? widgetKey,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        child: cupertinoContentPad(context, child, navigationBar, null),
        navigationBar: navigationBar,
        resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
      );
    }

    // Ensure that there is Material widget at the root page level
    // as there will still be Material widgets using on ios (for now)
    final materialWidget = context.ancestorWidgetOfExactType(Material);
    if (materialWidget == null) {
      return Material(
        elevation: 0.0,
        child: result,
      );
    }
    return result;
  }

  Widget cupertinoContentPad(BuildContext context, Widget child,
      ObstructingPreferredSizeWidget navigationBar, CupertinoTabBar tabBar) {
    final MediaQueryData existingMediaQuery = MediaQuery.of(context);

    if (!cupertinoContentPadding && !cupertinoContentBottomPadding) {
      return child;
    }

    double top = 0;
    double bottom = 0;

    if (cupertinoContentPadding && navigationBar != null) {
      final double topPadding =
          navigationBar.preferredSize.height + existingMediaQuery.padding.top;

      final obstruct = navigationBar.fullObstruction == null ||
          navigationBar.fullObstruction;

      top = !obstruct ? 0.0 : topPadding;
    }

    if (cupertinoContentBottomPadding && tabBar != null) {
      bottom = existingMediaQuery.padding.bottom;
    }

    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: child,
    );
  }
}

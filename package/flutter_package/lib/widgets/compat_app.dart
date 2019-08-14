import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/base/basic.dart';

import 'widget_base.dart';

abstract class _BaseData {
  _BaseData(
      {this.widgetKey,
      this.navigatorKey,
      this.home,
      this.routes,
      this.initialRoute,
      this.onGenerateRoute,
      this.onUnknownRoute,
      this.navigatorObservers,
      this.builder,
      this.title,
      this.onGenerateTitle,
      this.color,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      this.supportedLocales,
      this.showPerformanceOverlay,
      this.checkerboardRasterCacheImages,
      this.checkerboardOffscreenLayers,
      this.showSemanticsDebugger,
      this.debugShowCheckedModeBanner});

  final Key widgetKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
}

class MaterialAppData extends _BaseData {
  MaterialAppData(
      {Key widgetKey,
      GlobalKey<NavigatorState> navigatorKey,
      Widget home,
      Map<String, WidgetBuilder> routes,
      String initialRoute,
      RouteFactory onGenerateRoute,
      RouteFactory onUnknownRoute,
      List<NavigatorObserver> navigatorObservers,
      TransitionBuilder builder,
      String title,
      GenerateAppTitle onGenerateTitle,
      Color color,
      Locale locale,
      Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
      LocaleListResolutionCallback localeListResolutionCallback,
      LocaleResolutionCallback localeResolutionCallback,
      Iterable<Locale> supportedLocales,
      bool showPerformanceOverlay,
      bool checkerboardRasterCacheImages,
      bool checkerboardOffscreenLayers,
      bool showSemanticsDebugger,
      bool debugShowCheckedModeBanner,
      this.theme,
      this.debugShowMaterialGrid,
      this.darkTheme})
      : super(
            widgetKey: widgetKey,
            navigatorKey: navigatorKey,
            home: home,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner);

  final ThemeData theme;
  final bool debugShowMaterialGrid;
  final ThemeData darkTheme;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData(
      {Key widgetKey,
      GlobalKey<NavigatorState> navigatorKey,
      Widget home,
      Map<String, WidgetBuilder> routes,
      String initialRoute,
      RouteFactory onGenerateRoute,
      RouteFactory onUnknownRoute,
      List<NavigatorObserver> navigatorObservers,
      TransitionBuilder builder,
      String title,
      GenerateAppTitle onGenerateTitle,
      Color color,
      Locale locale,
      Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates,
      LocaleListResolutionCallback localeListResolutionCallback,
      LocaleResolutionCallback localeResolutionCallback,
      Iterable<Locale> supportedLocales,
      bool showPerformanceOverlay,
      bool checkerboardRasterCacheImages,
      bool checkerboardOffscreenLayers,
      bool showSemanticsDebugger,
      bool debugShowCheckedModeBanner,
      this.theme})
      : super(
            widgetKey: widgetKey,
            navigatorKey: navigatorKey,
            home: home,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner);

  final CupertinoThemeData theme;
}

class CompatApp extends BaseCompatWidget<CupertinoApp, MaterialApp> {
  final Key widgetKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;

  final CompatBuilder<MaterialAppData> material;
  final CompatBuilder<CupertinoAppData> cupertino;

  const CompatApp(
      {Key key,
      this.widgetKey,
      this.navigatorKey,
      this.home,
      this.routes = const <String, WidgetBuilder>{},
      this.initialRoute,
      this.onGenerateRoute,
      this.onUnknownRoute,
      this.navigatorObservers = const <NavigatorObserver>[],
      this.builder,
      this.title = '',
      this.onGenerateTitle,
      this.color,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      this.supportedLocales = const <Locale>[Locale('en', 'US')],
      this.showPerformanceOverlay = false,
      this.checkerboardRasterCacheImages = false,
      this.checkerboardOffscreenLayers = false,
      this.showSemanticsDebugger = false,
      this.debugShowCheckedModeBanner = true,
      this.material,
      this.cupertino})
      : super(key: key);

  @override
  materialWidget(BuildContext context) {
    MaterialAppData data;
    if (material != null) {
      data = material(context);
    }

    return MaterialApp(
      key: data?.widgetKey ?? widgetKey,
      navigatorKey: data?.navigatorKey ?? navigatorKey,
      home: data?.home ?? home,
      routes: data?.routes ?? routes,
      initialRoute: data?.initialRoute ?? initialRoute,
      onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
      onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
      navigatorObservers: data?.navigatorObservers ?? navigatorObservers,
      builder: data?.builder ?? builder,
      title: data?.title ?? title,
      onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
      color: data?.color ?? color,
      locale: data?.locale ?? locale,
      localizationsDelegates:
          data?.localizationsDelegates ?? localizationsDelegates,
      localeListResolutionCallback:
          data?.localeListResolutionCallback ?? localeListResolutionCallback,
      localeResolutionCallback:
          data?.localeResolutionCallback ?? localeResolutionCallback,
      supportedLocales: data?.supportedLocales ?? supportedLocales,
      showPerformanceOverlay:
          data?.showPerformanceOverlay ?? showPerformanceOverlay,
      checkerboardRasterCacheImages:
          data?.checkerboardRasterCacheImages ?? checkerboardRasterCacheImages,
      checkerboardOffscreenLayers:
          data?.checkerboardOffscreenLayers ?? checkerboardOffscreenLayers,
      showSemanticsDebugger:
          data?.showSemanticsDebugger ?? showSemanticsDebugger,
      debugShowCheckedModeBanner:
          data?.debugShowCheckedModeBanner ?? debugShowCheckedModeBanner,
      theme: data?.theme,
      debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false,
      darkTheme: data?.darkTheme,
    );
  }

  @override
  cupertinoWidget(BuildContext context) {
    CupertinoAppData data;
    if (cupertino != null) {
      data = cupertino(context);
    }

    return CupertinoApp(
      key: data?.widgetKey ?? widgetKey,
      navigatorKey: data?.navigatorKey ?? navigatorKey,
      home: data?.home ?? home,
      routes: data?.routes ?? routes,
      initialRoute: data?.initialRoute ?? initialRoute,
      onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
      onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
      navigatorObservers: data?.navigatorObservers ?? navigatorObservers,
      builder: data?.builder ?? builder,
      title: data?.title ?? title,
      onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
      color: data?.color ?? color,
      locale: data?.locale ?? locale,
      localizationsDelegates:
          data?.localizationsDelegates ?? localizationsDelegates,
      localeListResolutionCallback:
          data?.localeListResolutionCallback ?? localeListResolutionCallback,
      localeResolutionCallback:
          data?.localeResolutionCallback ?? localeResolutionCallback,
      supportedLocales: data?.supportedLocales ?? supportedLocales,
      showPerformanceOverlay:
          data?.showPerformanceOverlay ?? showPerformanceOverlay,
      checkerboardRasterCacheImages:
          data?.checkerboardRasterCacheImages ?? checkerboardRasterCacheImages,
      checkerboardOffscreenLayers:
          data?.checkerboardOffscreenLayers ?? checkerboardOffscreenLayers,
      showSemanticsDebugger:
          data?.showSemanticsDebugger ?? showSemanticsDebugger,
      debugShowCheckedModeBanner:
          data?.debugShowCheckedModeBanner ?? debugShowCheckedModeBanner,
      theme: data?.theme,
    );
  }
}

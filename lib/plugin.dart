import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_widget_compat.dart';

class PluginPage extends StatefulWidget {
  @override
  PluginPageState createState() => PluginPageState();
}

class PluginPageState extends State<PluginPage> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompatScaffold(
      appBar: CompatAppBar(
        title: Text('Plugin Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CompatButton(
              child: CompatText('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BatteryPercentage(),
    );
  }
}

class BatteryPercentage extends StatefulWidget {
  @override
  _BatteryPercentageState createState() => _BatteryPercentageState();
}

class _BatteryPercentageState extends State<BatteryPercentage> {
  Battery _battery = Battery();
  int? _batteryLevel;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Percentage'),
      ),
      body: Center(
        child: _batteryLevel != null
            ? Text('Battery Level: $_batteryLevel%')
            : Text('Battery level not available'),
      ),
    );
  }
}

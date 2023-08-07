import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(AccelerometerApp());
}

class AccelerometerApp extends StatefulWidget {
  @override
  _AccelerometerAppState createState() => _AccelerometerAppState();
}

class _AccelerometerAppState extends State<AccelerometerApp> {
  List<double> _accelerometerValues = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    // Initialize the accelerometer listener
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        // Update the accelerometer values
        _accelerometerValues = [event.x, event.y, event.z];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MTN Accelerometer App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Acceleration values:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'X: ${_accelerometerValues[0].toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Y: ${_accelerometerValues[1].toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Z: ${_accelerometerValues[2].toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

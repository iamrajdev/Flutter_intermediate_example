import 'dart:async';

import 'package:flutter/material.dart';

class IndicatorTimerExample extends StatefulWidget {
  const IndicatorTimerExample({Key? key}) : super(key: key);

  @override
  State<IndicatorTimerExample> createState() => _IndicatorTimerExampleState();
}

class _IndicatorTimerExampleState extends State<IndicatorTimerExample> {
  static Duration duration = Duration(milliseconds: 100);
  late Timer timer;
  double _value = 0.0;
  bool _active = false;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(duration, _timeOut);
  }

  void _timeOut(Timer timer) {
    if (!_active) return;
    setState(() {
      _value += 0.01;
      if (_value == 1) _active = false;
    });
  }

  void _onPressed() {
    _value = 0.0;
    setState(() {
      _active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer progress bar"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(32.0),
                child: LinearProgressIndicator(
                  value: _value,
                  backgroundColor: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _onPressed,
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

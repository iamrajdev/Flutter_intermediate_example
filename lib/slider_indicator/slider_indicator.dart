import 'package:flutter/material.dart';

class SliderIndicator extends StatefulWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  State<SliderIndicator> createState() => _SliderIndicatorState();
}

class _SliderIndicatorState extends State<SliderIndicator> {
  double _value = 0.0;

  void _onClicked(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider & Indicator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Slider(value: _value, onChanged: _onClicked),
              Container(
                padding: const EdgeInsets.all(26.0),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(26.0),
                child: CircularProgressIndicator(
                  value: _value,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

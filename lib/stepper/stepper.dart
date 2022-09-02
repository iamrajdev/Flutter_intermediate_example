import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key}) : super(key: key);

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;
  List<Step> getSteps() => [
        Step(
            title: const Text('Step 1'),
            content: const Text('Do Something 1'),
            isActive: _currentStep >= 0),
        Step(
            title: const Text('Step 2'),
            content: const Text('Do Something 2'),
            isActive: _currentStep >= 1),
        Step(
            title: const Text('Step 3'),
            content: const Text('Do Something 3'),
            isActive: _currentStep >= 2),
      ];

  void _stepContinue() {
    if (_currentStep < (getSteps().length - 1)) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _stepCancel() {
    setState(() {
      _currentStep--;
      if (_currentStep < 0) _currentStep = 0;
    });
  }

  void _stepTap(int index) {
    setState(() => _currentStep = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Example"),
      ),
      body: Container(
        child: Stepper(
          // type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepTapped: _stepTap,
          onStepContinue: _stepContinue,
          onStepCancel: _stepCancel,
          steps: getSteps(),
        ),
      ),
    );
  }
}

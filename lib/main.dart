import 'package:flutter/material.dart';
import 'package:flutter_intermediate/action_chip/action_chip_example.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Intermediate"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                  label: const Text('Action chip example'),
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActionChipExample()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
